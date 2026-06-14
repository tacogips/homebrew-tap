class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.24"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.24/rielflow-0.1.24-darwin-arm64.tar.gz"
      sha256 "1ca405f378344a805a6902dbbc57f471a40e04e75e0ba054d3d316a58efaefb5"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.24/rielflow-0.1.24-darwin-x64.tar.gz"
      sha256 "c7cd9312c6db761eba7628f0f7c4626273e72f33254a790228b100110b27e22d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.24/rielflow-0.1.24-linux-arm64.tar.gz"
      sha256 "8a0b22b7c07db2685b82d318e4963e259eace918c969049a74acef4c413e2a38"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.24/rielflow-0.1.24-linux-x64.tar.gz"
      sha256 "307dcdecfc9121120478cd79b5508d6113d7775481422a92337948e25209af17"
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
