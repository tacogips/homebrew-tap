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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-reader-0.1.23-darwin-arm64.tar.gz"
      sha256 "171f90f2437e07950f4f27d6553ae80112ad1cc0627048d7f3e56959750e934d"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-reader-0.1.23-darwin-x64.tar.gz"
      sha256 "8982cbb497d8cde5d98bf26f1ed3637f2fe37e793568901af51c21aff16d8808"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
