class Riela < Formula
  desc "Swift-native workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/riela"
  version "0.1.29"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/riela/releases/download/v0.1.29/riela-0.1.29-darwin-arm64.tar.gz"
      sha256 "6210e95052634953ca45f8c9e70ffd5b7f36c0ba42cfa3ee1e8e723e08bd1fd7"
    else
      url "https://github.com/tacogips/riela/releases/download/v0.1.29/riela-0.1.29-darwin-x64.tar.gz"
      sha256 "0b8870d6c005d437ba5a75117c4eb2f58a6d630044e92d38fdbdfe164070fded"
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
