class AgentGateway < Formula
  desc "ACP stdio agent that routes prompts to AI vendor CLIs and APIs"
  homepage "https://github.com/tacogips/agent-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.9/agent-gateway-0.1.9-darwin-arm64.tar.gz"
      sha256 "79a2fd3d009073ee1bc24d111800c3a962c231ce7de86885e39bd2a1b3d29a4e"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.9/agent-gateway-0.1.9-darwin-x64.tar.gz"
      sha256 "3374721bbc2ace86fa1bc8d17c9b7c50132e2d276f7c6234f8c2e171ee066a00"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/agent-gateway --version")
  end
end
