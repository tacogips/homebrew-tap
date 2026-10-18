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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-message-box-0.1.21-darwin-arm64.tar.gz"
      sha256 "df9482c55c1fb6333b41ee1f9da9d8deadb1847b45d40fd8c0d0bf70426224ff"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-message-box-0.1.21-darwin-x64.tar.gz"
      sha256 "227f7681a0df17c5ca70ca9372daac24e4abbd69b04db361383c4f7ce0c2e44b"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
