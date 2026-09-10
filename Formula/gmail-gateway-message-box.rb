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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-message-box-0.1.13-darwin-arm64.tar.gz"
      sha256 "f7e54d32366235b82e03f9df0ba06d5206172e8b46a56cda2dbfd3236ef45e43"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-message-box-0.1.13-darwin-x64.tar.gz"
      sha256 "b9d371e7b7f4df88a75af712b59480b902cc5df672c477796cf707ec5d6e8a83"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
