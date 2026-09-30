class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-reader-0.1.16-darwin-arm64.tar.gz"
      sha256 "6cc10396daa6bd25280381103b6519381297c1897146c16b769e32fb14a8d2ec"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-reader-0.1.16-darwin-x64.tar.gz"
      sha256 "6caac0e8138446c0d952b6fd1424ad6d5e0ac4a48e170764a6e8518adca56fc2"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
