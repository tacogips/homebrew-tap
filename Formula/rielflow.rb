class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.10"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.10/rielflow-0.1.10-darwin-arm64.tar.gz"
      sha256 "d855c07762cfc2a9616626da395296426609856dc57d97e0bc46ffbb44e345b9"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.10/rielflow-0.1.10-darwin-x64.tar.gz"
      sha256 "8717e33915b8f37472d1b753cb246d344149c849d51225af61e10a007d5b2cde"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.10/rielflow-0.1.10-linux-arm64.tar.gz"
      sha256 "60edc9ab3ea3a0cc5630243eae0fc21f09f15d6d77caa9d6a5eccead15c0696c"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.10/rielflow-0.1.10-linux-x64.tar.gz"
      sha256 "b0e3c0736163e939a6923f515d2d447c143155dd950a638a85e18cc3aca56925"
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
