class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.9"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.9/rielflow-0.1.9-darwin-arm64.tar.gz"
      sha256 "9af40337551119fd83cf4acabf69737031e4f7320e549f9c7cb6bdf783082ef8"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.9/rielflow-0.1.9-darwin-x64.tar.gz"
      sha256 "433324c3112defa4da5295b261c948dfc47ff87c2f6079468781fe384c040637"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.9/rielflow-0.1.9-linux-arm64.tar.gz"
      sha256 "ae4f4617184434c1ed461b83fc26bd8d370461c86d4ea0cd9fe651b5c20a44af"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.9/rielflow-0.1.9-linux-x64.tar.gz"
      sha256 "7dfd0e6d44de5d295a946ffd270b2521d9f5391add7c133945c23d4453677fad"
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
