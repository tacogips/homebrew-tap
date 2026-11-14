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
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.11/agent-gateway-0.1.11-darwin-arm64.tar.gz"
      sha256 "95ecac09d8ce4ccfb8580e95cf49f14cfc52f79bf521cd11f5827d4727379c04"
    else
      url "https://github.com/tacogips/agent-gateway/releases/download/v0.1.11/agent-gateway-0.1.11-darwin-x64.tar.gz"
      sha256 "ab22c4427f3efc4f165257de5a9c676fa444f987ff93d0c4b627eba19d9874c3"
    end
  end

  def install
    bin.install "bin/agent-gateway"
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/agent-gateway --version")
  end
end
