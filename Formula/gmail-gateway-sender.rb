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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-sender-0.1.29-darwin-arm64.tar.gz"
      sha256 "20ef93072df6fdfe5b783641e812420b9ef51e2e7c555f7e1a59e815d50e6d20"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-sender-0.1.29-darwin-x64.tar.gz"
      sha256 "e99994714ac0da836f57121df90ecb1ebd6c189c3b8cecbf4fb3b2fdfb55382f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
