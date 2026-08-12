class AgentGateway < Formula
  desc "ACP stdio agent that routes prompts to AI vendor CLIs and APIs"
  homepage "https://github.com/tacogips/agent-gateway"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.2/agent-gateway-0.1.2-darwin-arm64.tar.gz"
      sha256 "2d3e78d43ffcc29846dffc9aea6395cad21c6aea4b39a2b76df2949ae77223ad"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.2/agent-gateway-0.1.2-darwin-x64.tar.gz"
      sha256 "3205edd83ecf8cc15fd075e12e04a3d10836419f6d107a19cb7681cade31a858"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/agent-gateway --version")
  end
end
