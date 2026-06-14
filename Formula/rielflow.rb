class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.22"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.22/rielflow-0.1.22-darwin-arm64.tar.gz"
      sha256 "03089d4fabffeec83d3e2acf0885212b9451348733e8771f0b87ac7cb0cf0a39"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.22/rielflow-0.1.22-darwin-x64.tar.gz"
      sha256 "3ab049c3e1ce725217036546f0b4339f6fbd7f57bcf2a3ecabd90414ee9d6bd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.22/rielflow-0.1.22-linux-arm64.tar.gz"
      sha256 "5982e5f3db42f4f790542347d8062eeeb1db780ac95d714bcc22522b0a1e3953"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.22/rielflow-0.1.22-linux-x64.tar.gz"
      sha256 "4bf1111746b23699d9b29f1e90cc448f31ad8d9a532ac0fa20bbb440940f8429"
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
