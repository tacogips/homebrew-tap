class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.25"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.25/rielflow-0.1.25-darwin-arm64.tar.gz"
      sha256 "53a90a310bf52a9741f1d53b37e3a06c52461364d7299b1e3df4aef97ea7d794"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.25/rielflow-0.1.25-darwin-x64.tar.gz"
      sha256 "50f9d44b004b89b5d36125a48c9157789f5a1b35b0e9ea8f54f5b705883d7afe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.25/rielflow-0.1.25-linux-arm64.tar.gz"
      sha256 "a665fc985bcbfaf23e2761828568fe1e2d63f93b3d2f325c7f1a2cb571b8c320"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.25/rielflow-0.1.25-linux-x64.tar.gz"
      sha256 "ff36e3385bdca15caf82be05a8cf8e9a492c7b826888139477fdf6df61a77ab1"
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
