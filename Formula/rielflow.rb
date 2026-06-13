class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.16"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.16/rielflow-0.1.16-darwin-arm64.tar.gz"
      sha256 "0332e1edb3816936507e8659b7429c6eef997e5029e05e6d7e63dc370233c639"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.16/rielflow-0.1.16-darwin-x64.tar.gz"
      sha256 "6016e106d8c0ae02739843a84a1d9793e325be8667fdb5abb80453f55e1bc3a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.16/rielflow-0.1.16-linux-arm64.tar.gz"
      sha256 "a0f8dffcdc17e4224e8bf54e51f35927b7d7bfe968ef99327a64c919fd0b459d"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.16/rielflow-0.1.16-linux-x64.tar.gz"
      sha256 "a9f20b1649a0c16b3da22a18025c635d221672cf1533d05cb767673d6f8b3d70"
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
