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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-message-box-0.1.17-darwin-arm64.tar.gz"
      sha256 "11c018664904cb64848039be55ff9287c918a5110486e9b11cf725a530be6896"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-message-box-0.1.17-darwin-x64.tar.gz"
      sha256 "f521541383053be65a4d28c33e8124779d5fbb4ae5c6430aa1ce700c344fb47b"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
