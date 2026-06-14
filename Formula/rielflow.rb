class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.23"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.23/rielflow-0.1.23-darwin-arm64.tar.gz"
      sha256 "8140f54d26428a646bfbfe31cd26529fa1f53e035fd42e9c8d8448bb9d57c680"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.23/rielflow-0.1.23-darwin-x64.tar.gz"
      sha256 "03f15685468738eaf22a4750c7cc9d85bfc4a74a90aaf18b52e517a715128362"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.23/rielflow-0.1.23-linux-arm64.tar.gz"
      sha256 "efc40a89f1227b077cc47ad2fdf6740233420449a86f3a5cba5459e6e8b3d0b9"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.23/rielflow-0.1.23-linux-x64.tar.gz"
      sha256 "7d1eb4f3b22c10b671f0c5b53a2e235a2026d95f06cfa382783876f988b9e763"
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
