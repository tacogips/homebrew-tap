class AgentGateway < Formula
  desc "ACP stdio agent that routes prompts to AI vendor CLIs and APIs"
  homepage "https://github.com/tacogips/agent-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.1/agent-gateway-0.1.1-darwin-arm64.tar.gz"
      sha256 "0cdc77663b81e857737cf4ccf89c3bfb83b2140935a4a54614376bb6af2bd985"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.1/agent-gateway-0.1.1-darwin-x64.tar.gz"
      sha256 "7037316ae6130391a715e4e58362b7ae2fd8d46cd31b38a5d8f757297c1601c2"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/agent-gateway --version")
  end
end
