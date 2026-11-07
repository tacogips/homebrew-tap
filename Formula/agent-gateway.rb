class AgentGateway < Formula
  desc "ACP stdio agent that routes prompts to AI vendor CLIs and APIs"
  homepage "https://github.com/tacogips/agent-gateway"
  version "0.1.8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.8/agent-gateway-0.1.8-darwin-arm64.tar.gz"
      sha256 "3d760b68124ea2e3dd3c4f3e96b31a8b0258fe010b68b61839bd928845336cf9"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.8/agent-gateway-0.1.8-darwin-x64.tar.gz"
      sha256 "67b45e77e29ae138e9762769b4f28f34a64a6e0ed4d16b57a30276f41b6e3ee8"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/agent-gateway --version")
  end
end
