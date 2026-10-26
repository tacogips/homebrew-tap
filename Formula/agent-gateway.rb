class AgentGateway < Formula
  desc "ACP stdio agent that routes prompts to AI vendor CLIs and APIs"
  homepage "https://github.com/tacogips/agent-gateway"
  version "0.1.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.6/agent-gateway-0.1.6-darwin-arm64.tar.gz"
      sha256 "d8cfaf2824329b68703b4d89223693027ebf124e54a3c123acfe7ab9a2bb65b7"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.6/agent-gateway-0.1.6-darwin-x64.tar.gz"
      sha256 "7305100707c7c8a34ce22bb6286cdd181f294d23fd5d7f99cff16f466dca59cd"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/agent-gateway --version")
  end
end
