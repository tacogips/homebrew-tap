class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.7/rielflow-0.1.7-darwin-arm64.tar.gz"
      sha256 "2d426d86729224aefbf4e2891b239fe19da74e458144b7e3d37bcfb52c1be492"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.7/rielflow-0.1.7-darwin-x64.tar.gz"
      sha256 "442ed4b1acb975ca114a4e41634fa0e04d401aafb60a9e169dffa9afa3bb2386"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.7/rielflow-0.1.7-linux-arm64.tar.gz"
      sha256 "7efa2cbaa4a8674c95042e8e1e9a246b6590ef99f937a96aef8af271858643bb"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.7/rielflow-0.1.7-linux-x64.tar.gz"
      sha256 "2ddc6a97514c488bf61ae8bd1b4934285128673a1e2a488e8dec23557e4499ff"
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
