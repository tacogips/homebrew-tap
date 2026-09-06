class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-sender-0.1.11-darwin-arm64.tar.gz"
      sha256 "75e514b027bbb87df05bfcf29ed1a33883c595eff98bee340a92b90625bcf49d"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-sender-0.1.11-darwin-x64.tar.gz"
      sha256 "035b5ab50f5637e1d09421d0d60ca5b1a70f340faf2ada8b5f9d0f5ee00aba18"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
