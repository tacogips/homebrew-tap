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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-sender-0.1.25-darwin-arm64.tar.gz"
      sha256 "989de42ad709dfc765a3f0a553fc2ab9447a4d11ea96578b3e91dc4b057e8dfe"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-sender-0.1.25-darwin-x64.tar.gz"
      sha256 "06926c378664bafe65c0d41f42c85b53c0e06b6cf173b39186bc66038e709cd2"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
