class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.8/gmail-gateway-sender-0.1.8-darwin-arm64.tar.gz"
      sha256 "04e9f47f4fa0444e7680cad775c0cf900ebcd52ee5a729be3465511e99e09003"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.8/gmail-gateway-sender-0.1.8-darwin-x64.tar.gz"
      sha256 "b714ab4f0fb6d8967e4a966ebc2da34b365c16529cf1beb4f0e37ddd407ea762"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
