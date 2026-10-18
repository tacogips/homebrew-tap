class GmailGatewayMessageBox < Formula
  desc "Mail-ingesting Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-message-box-0.1.20-darwin-arm64.tar.gz"
      sha256 "4a619fb46691846163f2f824d96ace5041249254bed74000311205d000647a69"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-message-box-0.1.20-darwin-x64.tar.gz"
      sha256 "e6af1afdec12a17232557a221d2aaf1407ccacd65718936d770436d09d08d79f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
