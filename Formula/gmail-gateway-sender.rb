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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-sender-0.1.18-darwin-arm64.tar.gz"
      sha256 "4ab314db4ed29401bc908828e1541f2b7682e17475ae807a3a13b12f3443baba"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-sender-0.1.18-darwin-x64.tar.gz"
      sha256 "5fdf8052aac5ed39d2f0a00714a643d784dd1976c6b693213d3119e739c873e4"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
