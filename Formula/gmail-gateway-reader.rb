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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-reader-0.1.24-darwin-arm64.tar.gz"
      sha256 "c44befa0df1f180653ed5a8eaba85f1efbadb9c63ed6808a3d8d07a7ff529321"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-reader-0.1.24-darwin-x64.tar.gz"
      sha256 "aba9ba9e25787241bcb6482e93e4cdff5246c55c48c624a9d83dc0db26647f00"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
