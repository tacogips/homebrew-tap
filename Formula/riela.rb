class Riela < Formula
  desc "Swift-native workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/riela"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/tacogips/riela/releases/download/v0.1.44/riela-0.1.44-darwin-arm64.tar.gz"
      sha256 "5ad4562d1d25133280b322350d7f10902214a00590c82c2a959e63463215b8d6"
    end
  end

  def install
    bin.install "bin/riela"
    share.install "share/riela"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/riela --help")
    (testpath/"addon-smoke").mkpath
    (testpath/"addon-smoke/workflow.json").write <<~JSON
      {
        "workflowId": "addon-smoke",
        "description": "Smoke workflow that requires built-in add-on package resolution.",
        "defaults": {
          "maxLoopIterations": 3,
          "nodeTimeoutMs": 120000
        },
        "entryStepId": "send-reply",
        "nodes": [
          {
            "id": "send-reply",
            "addon": {
              "name": "riela/chat-reply-worker",
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
      "#{bin}/riela workflow usage addon-smoke --workflow-definition-dir #{testpath} --output json",
    )
    assert_match '"workflowId":"addon-smoke"', usage
    assert_match %r{riela\\?/chat-reply-worker}, usage
  end
end
