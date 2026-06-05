class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.11/rielflow-0.1.11-darwin-arm64.tar.gz"
      sha256 "1948e94ccbd4b752aa49bce38820fe94ceaa6140938c5462e030bb62baeee696"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.11/rielflow-0.1.11-darwin-x64.tar.gz"
      sha256 "ac08f0e5aa46b23dec09e53ba7e263789aee41eaf2217fc70a32bb34215b736f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.11/rielflow-0.1.11-linux-arm64.tar.gz"
      sha256 "16d6e1b14036c90907f6faf146d236e1a568f9b0b5eb44c541adcb11f4e84a2b"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.11/rielflow-0.1.11-linux-x64.tar.gz"
      sha256 "a18a943d37ca77b85583c89d66e9e1a2cd0f5142a4202e81f652b4f6d6cfbd08"
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
