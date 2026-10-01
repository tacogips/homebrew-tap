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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-sender-0.1.17-darwin-arm64.tar.gz"
      sha256 "dc8931e9a28c9698587b158b768029c49648bd2783b4e71e87e73ec691370de3"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-sender-0.1.17-darwin-x64.tar.gz"
      sha256 "777efa7014863b77e0b7cddd1cc091ab37f39403fc4797fe93a90a3611588117"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
