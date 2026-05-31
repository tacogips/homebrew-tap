class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.5/rielflow-0.1.5-darwin-arm64.tar.gz"
      sha256 "3a98e812d8f2b3f6e63f6591d8c2a9e6c5485454bf9555b9a7fa1c7861042fb0"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.5/rielflow-0.1.5-darwin-x64.tar.gz"
      sha256 "8f4753d04f717e880988399e29af0e0bef76b7f14671914e9c4b78f8f91af8af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.5/rielflow-0.1.5-linux-arm64.tar.gz"
      sha256 "ab26ad62969b6868f214aeb6be8991e735ffa9adb1f578a72c090af764cb7151"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.5/rielflow-0.1.5-linux-x64.tar.gz"
      sha256 "70ca11bc3031d6cb36491cf6e26ad98932e9eae0a2ffd5c4a71bf409803d0c3e"
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
