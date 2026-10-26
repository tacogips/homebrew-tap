class AgentGateway < Formula
  desc "ACP stdio agent that routes prompts to AI vendor CLIs and APIs"
  homepage "https://github.com/tacogips/agent-gateway"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.5/agent-gateway-0.1.5-darwin-arm64.tar.gz"
      sha256 "71f55d7448392620404fd9f25fe2cf5875152569b23b26e144b2aeaee5e98b09"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.5/agent-gateway-0.1.5-darwin-x64.tar.gz"
      sha256 "346f07c2a06be9ae83ebef157d6f893658b6ad44b65c9346de90e6c6235a61e5"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/agent-gateway --version")
  end
end
