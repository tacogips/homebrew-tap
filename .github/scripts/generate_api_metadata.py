#!/usr/bin/env python3
"""Generate Homebrew API metadata for every formula and cask in this tap."""

from __future__ import annotations

import hashlib
import json
import os
import pathlib
import re
import subprocess
import sys
from typing import Any


ROOT = pathlib.Path(__file__).resolve().parents[2]
TAP = "tacogips/tap"
TOKEN_PATTERN = re.compile(r"[a-z0-9][a-z0-9+._@-]*")
LOCAL_STATE_DEFAULTS = {
    "formula": {
        "installed": [],
        "linked_keg": None,
        "pinned": False,
        "outdated": False,
    },
    "cask": {
        "installed": None,
        "installed_time": None,
        "bundle_version": None,
        "bundle_short_version": None,
        "pinned": False,
        "pinned_version": None,
        "outdated": False,
    },
}


def git_head() -> str:
    result = subprocess.run(
        ["git", "rev-parse", "HEAD"],
        cwd=ROOT,
        check=True,
        capture_output=True,
        text=True,
    )
    return result.stdout.strip()


def brew_metadata(kind: str, token: str) -> dict[str, Any]:
    env = os.environ.copy()
    env["HOMEBREW_NO_AUTO_UPDATE"] = "1"
    env["HOMEBREW_NO_INSTALL_FROM_API"] = "1"
    command = ["brew", "info", "--json=v2"]
    if kind == "cask":
        command.append("--variations")
    command.extend([f"--{kind}", f"{TAP}/{token}"])
    result = subprocess.run(
        command,
        check=True,
        capture_output=True,
        text=True,
        env=env,
    )
    payload = json.loads(result.stdout)
    collection = payload["formulae" if kind == "formula" else "casks"]
    if len(collection) != 1 or not isinstance(collection[0], dict):
        raise SystemExit(f"brew returned invalid {kind} metadata for {token}")

    metadata = collection[0]
    for field, value in LOCAL_STATE_DEFAULTS[kind].items():
        metadata[field] = value
    return metadata


def validate_metadata(
    kind: str,
    token: str,
    source_path: pathlib.Path,
    metadata: dict[str, Any],
    source_head: str,
) -> None:
    relative_source = source_path.relative_to(ROOT).as_posix()
    expected = {
        "tap": TAP,
        "tap_git_head": source_head,
        "ruby_source_path": relative_source,
    }
    expected["name" if kind == "formula" else "token"] = token
    expected["full_name" if kind == "formula" else "full_token"] = f"{TAP}/{token}"
    for field, value in expected.items():
        if metadata.get(field) != value:
            raise SystemExit(
                f"{kind} {token}: {field} is {metadata.get(field)!r}, expected {value!r}; "
                "sync the tapped checkout to this commit before generating"
            )

    checksum = metadata.get("ruby_source_checksum")
    expected_checksum = hashlib.sha256(source_path.read_bytes()).hexdigest()
    if not isinstance(checksum, dict) or checksum.get("sha256") != expected_checksum:
        raise SystemExit(f"{kind} {token}: ruby source checksum is stale")

    if kind == "formula":
        stable = metadata.get("urls", {}).get("stable", {})
        required = {"version": metadata.get("versions", {}).get("stable"), **stable}
        for field in ("version", "url", "checksum"):
            if not isinstance(required.get(field), str) or not required[field]:
                raise SystemExit(f"formula {token}: missing stable {field}")
    else:
        for field in ("version", "url", "sha256"):
            if not isinstance(metadata.get(field), str) or not metadata[field]:
                raise SystemExit(f"cask {token}: missing {field}")
        if not metadata.get("artifacts"):
            raise SystemExit(f"cask {token}: missing artifacts")


def generate_kind(kind: str, source_dir: str, output_dir: str, source_head: str) -> None:
    sources = sorted((ROOT / source_dir).glob("*.rb"))
    if not sources:
        raise SystemExit(f"no {kind}s found in {source_dir}")

    destination = ROOT / "api" / output_dir
    generated: dict[pathlib.Path, str] = {}
    for source_path in sources:
        token = source_path.stem
        if not TOKEN_PATTERN.fullmatch(token):
            raise SystemExit(f"unsupported {kind} token: {token!r}")
        metadata = brew_metadata(kind, token)
        validate_metadata(kind, token, source_path, metadata, source_head)
        generated[destination / f"{token}.json"] = json.dumps(
            metadata,
            indent=2,
            sort_keys=True,
        ) + "\n"

    destination.mkdir(parents=True, exist_ok=True)
    for stale_path in destination.glob("*.json"):
        if stale_path not in generated:
            stale_path.unlink()
            print(f"removed stale {stale_path.relative_to(ROOT)}")
    for output_path, content in generated.items():
        output_path.write_text(content)
        print(f"generated {output_path.relative_to(ROOT)}")


def main() -> None:
    try:
        source_head = git_head()
        generate_kind("formula", "Formula", "formula", source_head)
        generate_kind("cask", "Casks", "cask", source_head)
    except (json.JSONDecodeError, subprocess.CalledProcessError) as error:
        if isinstance(error, subprocess.CalledProcessError) and error.stderr:
            print(error.stderr.rstrip(), file=sys.stderr)
        raise SystemExit(str(error)) from error


if __name__ == "__main__":
    main()
