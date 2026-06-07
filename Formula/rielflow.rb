class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.14"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.14/rielflow-0.1.14-darwin-arm64.tar.gz"
      sha256 "5b34f20bd978eced18f95771b7b9ee445459d225c5cd53f110ed9c580f3d7f9d"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.14/rielflow-0.1.14-darwin-x64.tar.gz"
      sha256 "579d40c518ac38835bdc9176d2072dd3cd128ddcf8935657db122c8804f64d5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.14/rielflow-0.1.14-linux-arm64.tar.gz"
      sha256 "265712333f26b7e240697b4830e9c9d0a17aeffeab944f065ab8ab8beea1fbb5"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.14/rielflow-0.1.14-linux-x64.tar.gz"
      sha256 "5b5c4ed5fa909397d7a4f027849bb7afb9422e33f3984719e4f1a7fead2856e6"
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
