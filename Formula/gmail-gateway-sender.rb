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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-sender-0.1.21-darwin-arm64.tar.gz"
      sha256 "5804414a89f4af242249f5e12eee03fcdfbffe27aef2b93d5e460f72c1537c5d"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-sender-0.1.21-darwin-x64.tar.gz"
      sha256 "e164b4828e76af4752febf371bbf2eb00e2bc13f6756cfa316a36bcb57370047"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
