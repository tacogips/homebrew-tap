class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.6/rielflow-0.1.6-darwin-arm64.tar.gz"
      sha256 "87a01a59539149849aa43ef894191381d64570f36eff447644d634dbaa6ac4b9"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.6/rielflow-0.1.6-darwin-x64.tar.gz"
      sha256 "6500cc655792bdb2e49aecc2bbce46cdf615debe86d87fda6a6688385c79da76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.6/rielflow-0.1.6-linux-arm64.tar.gz"
      sha256 "106887e5e52f326379cf6497b64e012290a0208e2e40f2ad171b326ea1c9ad0f"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.6/rielflow-0.1.6-linux-x64.tar.gz"
      sha256 "9b2bf36cecf7ec008dd68e0070d9493d650b6f106e96878a104e499251359086"
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
