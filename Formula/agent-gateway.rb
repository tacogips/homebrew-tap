class AgentGateway < Formula
  desc "ACP stdio agent that routes prompts to AI vendor CLIs and APIs"
  homepage "https://github.com/tacogips/agent-gateway"
  version "0.1.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.7/agent-gateway-0.1.7-darwin-arm64.tar.gz"
      sha256 "f40938ae59b0e79072041c91d65d565e4889ec1ff451ceddc2adf4bd4a6114bc"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.7/agent-gateway-0.1.7-darwin-x64.tar.gz"
      sha256 "6b382101e82f1196f8074f19ac68478e591f1e56464da590bcf3e2ca1c3788ea"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/agent-gateway --version")
  end
end
