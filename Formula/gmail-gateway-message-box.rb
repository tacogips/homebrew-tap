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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-message-box-0.1.16-darwin-arm64.tar.gz"
      sha256 "3ac4f72ccc42ccbed538e09c58f8e0f32d9f8d20746c781ea34ff0b3e3394567"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-message-box-0.1.16-darwin-x64.tar.gz"
      sha256 "8f365fdf1fe44bc402f70b5c89e4aba78c536ef422977cb574f8e586323ff50f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
