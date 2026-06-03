class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.8/rielflow-0.1.8-darwin-arm64.tar.gz"
      sha256 "2e0e856c2452d6798d5864de57571591666513c62385192c748790771d469acd"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.8/rielflow-0.1.8-darwin-x64.tar.gz"
      sha256 "4898067cd7c88b60517f883fea72feffef2ff6b013c8fe96e4f4bdfb95b24556"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.8/rielflow-0.1.8-linux-arm64.tar.gz"
      sha256 "72cd92d54d0a8e56e7ee8287892a276b565cded756120ec2ee73c939fd5b6b73"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.8/rielflow-0.1.8-linux-x64.tar.gz"
      sha256 "e046c657e9f66a3051b1d6c82dcf8e05727e57e6a8f5397599d3e6a51e1e6ad1"
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
