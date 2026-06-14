class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.20"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.20/rielflow-0.1.20-darwin-arm64.tar.gz"
      sha256 "120208e323fe18c9fa90d2bd118a90092b60594de0cc3a360436d0745390e156"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.20/rielflow-0.1.20-darwin-x64.tar.gz"
      sha256 "72c0ee9c059c26aad67da80f7a02ca0934935f14ca530b79a5de423ef0a892d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.20/rielflow-0.1.20-linux-arm64.tar.gz"
      sha256 "af52fa891f407626f19c02a1ec936958044f6d8ede132f2b73718bdacd6ef481"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.20/rielflow-0.1.20-linux-x64.tar.gz"
      sha256 "1f5e1e1473a6d300b84c636ea2ff55cb76fe571414f57d442e78738497393ed4"
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
