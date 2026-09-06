class GmailGatewayMessageBox < Formula
  desc "Mail-ingesting Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.10"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-message-box-0.1.10-darwin-arm64.tar.gz"
      sha256 "68126feedd2840de46cc776ef21c3caf18d0b6c5d4bbb03487d7fb835061da74"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-message-box-0.1.10-darwin-x64.tar.gz"
      sha256 "d61719b3a99a6d195527f2104d752271fbc7fdb3520f6c3df2d0b6132cce5650"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
