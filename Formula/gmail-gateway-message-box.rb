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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-message-box-0.1.26-darwin-arm64.tar.gz"
      sha256 "d1dd53fc17ab15d284986779dcca08f5b403c4679d7ad7bcd6fabb9021a9b4ec"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-message-box-0.1.26-darwin-x64.tar.gz"
      sha256 "562b0e2832eaf52fefe9e7797df140073ced6e401011877626a403fe4d7f8144"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
