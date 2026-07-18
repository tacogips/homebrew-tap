class MailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.6/mail-gateway-sender-0.1.6-darwin-arm64.tar.gz"
      sha256 "7db0b43f2b0664f09c5a4b9b4693e49ef58d74bcdef15f7aafd9d6ae4a53ae52"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.6/mail-gateway-sender-0.1.6-darwin-x64.tar.gz"
      sha256 "5e11693c4177833bfee2d21cde7c36960d6b0708e49147f939d8a475d3ad30eb"
    end
  end

  def install
    bin.install "bin/mail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-sender --help")
  end
end
