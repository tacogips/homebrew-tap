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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-sender-0.1.24-darwin-arm64.tar.gz"
      sha256 "68663179c9ce77d01fea04c9657c409abade311c35bb8aa86f350f933c84a072"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-sender-0.1.24-darwin-x64.tar.gz"
      sha256 "0ad20e63a088ef0744767ae7d1a3ce8810bdda4a82b4fdaaa1946da6006cf31a"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
