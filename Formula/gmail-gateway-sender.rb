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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-sender-0.1.23-darwin-arm64.tar.gz"
      sha256 "9dac773c34567928c53b72e70de42712ecdb04b6f0b2c9edc5b7d24ae534df70"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-sender-0.1.23-darwin-x64.tar.gz"
      sha256 "80237bb33b581e32e9d3f8d52a8ef3290fb3e8cb5da2edfbd0ee0068d0d7e05c"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
