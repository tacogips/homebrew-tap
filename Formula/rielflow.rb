class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.18"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.18/rielflow-0.1.18-darwin-arm64.tar.gz"
      sha256 "2c60252197b8c54391973ec5e2258cdd87a54d5736f76e44ad5a1f40a9fcdf16"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.18/rielflow-0.1.18-darwin-x64.tar.gz"
      sha256 "4bb882aa06066291a7cb0a9da2579c4a04f27c71f7fc00fb3b72c44e8d709971"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.18/rielflow-0.1.18-linux-arm64.tar.gz"
      sha256 "e1bd988d319ffcfa5448d55a71be6405306cf7d0d2af46cb30b25dda873fcad6"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.18/rielflow-0.1.18-linux-x64.tar.gz"
      sha256 "84593a371f01d09f054d4f2dcf61647ee402babd2fc3a2257d44a333004591e6"
    end
  end

  def install
    bin.install "bin/rielflow"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rielflow --help")
    (testpath/"addon-smoke").mkpath
    (testpath/"addon-smoke/workflow.json").write <<~JSON
      {
        "workflowId": "addon-smoke",
        "description": "Smoke workflow that requires built-in add-on package resolution.",
        "defaults": {
          "maxLoopIterations": 1,
          "nodeTimeoutMs": 60000
        },
        "entryStepId": "send-reply",
        "nodes": [
          {
            "id": "send-reply",
            "addon": {
              "name": "rielflow/chat-reply-worker",
              "version": "1",
              "config": {
                "textTemplate": "ok",
                "visibility": "public",
                "threadPolicy": "same-thread",
                "onMissingTarget": "dry-run"
              }
            }
          }
        ],
        "steps": [
          {
            "id": "send-reply",
            "nodeId": "send-reply",
            "role": "worker"
          }
        ]
      }
    JSON
    usage = shell_output(
      "#{bin}/rielflow workflow usage addon-smoke --workflow-definition-dir #{testpath} --output json",
    )
    assert_match '"workflowId": "addon-smoke"', usage
  end
end
