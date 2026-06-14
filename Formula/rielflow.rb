class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.21"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.21/rielflow-0.1.21-darwin-arm64.tar.gz"
      sha256 "920b483eefa15f9ab21eb97341b651ba9c6ab9458a39ed4a03325caa5fa295ad"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.21/rielflow-0.1.21-darwin-x64.tar.gz"
      sha256 "d70f45f4d33a00667784581e775573e7ed5f889f6dd92b7f37588b2daa6312fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.21/rielflow-0.1.21-linux-arm64.tar.gz"
      sha256 "c5f9ca72f723138f1e4a002652e90e1a28744f8e13600f1746595c4a18c51fba"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.21/rielflow-0.1.21-linux-x64.tar.gz"
      sha256 "8ba0f9cf041fd2778225d1f11dbe5771fbdca8e795611b25b9334a0dd08e550e"
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
