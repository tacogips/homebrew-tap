class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.12"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.12/rielflow-0.1.12-darwin-arm64.tar.gz"
      sha256 "211450b3bdacddb343f870667a65414620b4328c3d8e4933975c448452a00ea1"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.12/rielflow-0.1.12-darwin-x64.tar.gz"
      sha256 "12df8d863b723db2e0b31f54a5be865da45658a5a847b06944a27866b52af53e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.12/rielflow-0.1.12-linux-arm64.tar.gz"
      sha256 "57311b2809b79396f7979ffbdbeebc41ddb8b4b00933a4805d285ec2e2b99425"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.12/rielflow-0.1.12-linux-x64.tar.gz"
      sha256 "e4b63454abf07adf60546db15faeaa0134fbcfc96bd2a3bbeb03bad8d3244e15"
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
