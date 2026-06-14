class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.19"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.19/rielflow-0.1.19-darwin-arm64.tar.gz"
      sha256 "90f0bbb726220359364f7ae22904424de9f0e7ecae6a92138c2b24be0ecaee6e"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.19/rielflow-0.1.19-darwin-x64.tar.gz"
      sha256 "7818dd1d09935e5a3077c62cb374ef6fbc074a4770efb6971b5efe45c223a82d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.19/rielflow-0.1.19-linux-arm64.tar.gz"
      sha256 "880f7522a330f086abc3c72d5831f3554deef3b4e8aac0d2c87e5af5b1519e47"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.19/rielflow-0.1.19-linux-x64.tar.gz"
      sha256 "f6bba3a17c018c5183b41f733a457e40b2d32878d6bdcb9fc0bf5bbde7f905c6"
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
