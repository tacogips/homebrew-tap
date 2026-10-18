class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-sender-0.1.20-darwin-arm64.tar.gz"
      sha256 "d9d480d672905ff11a78baa18d0a5c7f344ab44b059025aa6ff15069da3cb553"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-sender-0.1.20-darwin-x64.tar.gz"
      sha256 "3e3cf89c48dbcbb9e51e1a6a0142755738ce4907b1ceb9931db9fda7287501cc"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
