class Riela < Formula
  desc "Swift-native workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/riela"
  version "0.1.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/riela/releases/download/v0.1.11/riela-0.1.11-darwin-arm64.tar.gz"
      sha256 "13b34da3b4ffa2c80fbf3babd6813770d7524379932f5401553bdd5b59bbc053"
    else
      url "https://github.com/tacogips/riela/releases/download/v0.1.11/riela-0.1.11-darwin-x64.tar.gz"
      sha256 "c035ddd371a2ecfe1db4868540ceadbebeccb43324b8ea76ee0360560dbb4a1d"
    end
  end

  def install
    bin.install "bin/riela"
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
