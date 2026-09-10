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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-message-box-0.1.14-darwin-arm64.tar.gz"
      sha256 "2d38042ff920cf246d643690358fdcf157afeb5cdc567573c966e5d781475026"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-message-box-0.1.14-darwin-x64.tar.gz"
      sha256 "46727f7404cbb8800c7298f227400be6500aead72ae6a023fe8c6ff6a927281e"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
