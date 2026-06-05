class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.13"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.13/rielflow-0.1.13-darwin-arm64.tar.gz"
      sha256 "b7a1ea0d0ecd50eb97edec1fa6ba2f775cffdc65088e73220eb2a25e74466a50"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.13/rielflow-0.1.13-darwin-x64.tar.gz"
      sha256 "971717a40b2948cc49a75088a73343f6bd661c26b651f21adfd054d9cdce1592"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.13/rielflow-0.1.13-linux-arm64.tar.gz"
      sha256 "37aa6355e046618a73fa9875869459766f69a40e7127b3d4a62c092d3b24e17c"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.13/rielflow-0.1.13-linux-x64.tar.gz"
      sha256 "5637f1c722bac4668957f7adfdd593f19fdee41517f970f232f5c83f5059fe80"
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
