class AgentGateway < Formula
  desc "ACP stdio agent that routes prompts to AI vendor CLIs and APIs"
  homepage "https://github.com/tacogips/agent-gateway"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.4/agent-gateway-0.1.4-darwin-arm64.tar.gz"
      sha256 "49c7fc8d34814306691858785b2eb5d3d6d87c905e19756760377283ef726ff3"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.4/agent-gateway-0.1.4-darwin-x64.tar.gz"
      sha256 "21f603da663a69d25412a2e5f9a42078e4c21c4a3fcf28987e4427ea7744a0e2"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/agent-gateway --version")
  end
end
