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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-message-box-0.1.24-darwin-arm64.tar.gz"
      sha256 "96608c0ca00e1c5e645259dcef7248ef6c10192019f23fdbc53fd31f628ff7cc"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-message-box-0.1.24-darwin-x64.tar.gz"
      sha256 "d3221b275ee2872c8be0923b384b2ed38dde5549c833648d8cc972a4069b9e97"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
