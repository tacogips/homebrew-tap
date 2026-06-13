class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.17"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.17/rielflow-0.1.17-darwin-arm64.tar.gz"
      sha256 "261eacf4d2a3ddfc0fb86330097c78de4026b383503d7d5186121a71605a84c4"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.17/rielflow-0.1.17-darwin-x64.tar.gz"
      sha256 "c385fed6f5e37da89f5b85cdc977c0814d02856afd7e09dc61e4d93d49c7fbdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.17/rielflow-0.1.17-linux-arm64.tar.gz"
      sha256 "7e2de0d9f6e2cb8bfa8aa30a5d521859f95cc89a79b422241e3b6609daa01957"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.17/rielflow-0.1.17-linux-x64.tar.gz"
      sha256 "a68516e92b6a01fc0dcf513580df1e61e67366794e49b7525b43ac8b473d5ea1"
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
