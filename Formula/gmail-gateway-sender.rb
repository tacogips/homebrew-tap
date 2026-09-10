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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-sender-0.1.13-darwin-arm64.tar.gz"
      sha256 "9e99ba316ea35c21fa46485cc631febf4e3eee12af8da0bad5af2a9eb6133c88"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-sender-0.1.13-darwin-x64.tar.gz"
      sha256 "8e2dfb02f5f1e6f927c9ab0da6a3f02b67ee7cfee979727e1ef42081fe6f00ed"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
