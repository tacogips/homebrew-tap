class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.15"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.15/rielflow-0.1.15-darwin-arm64.tar.gz"
      sha256 "c35ebd70a20151249b69cbec37d00f116a7d6ab9206141afcbfefeb176713901"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.15/rielflow-0.1.15-darwin-x64.tar.gz"
      sha256 "322e62fd8de83ab4182bd81c1a2bd83ef5f2399c14d369d66497cd6e958f5993"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.15/rielflow-0.1.15-linux-arm64.tar.gz"
      sha256 "6f75c1a0ab951f1b64fdbe5cc1ffb6efafd615f22baa1ef67f7217592404265d"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.15/rielflow-0.1.15-linux-x64.tar.gz"
      sha256 "764dda074a12ccf0cd7a61fc4435981ca25ac8007013f38eed6626b715809726"
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
