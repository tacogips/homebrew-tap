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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-reader-0.1.15-darwin-arm64.tar.gz"
      sha256 "470f3db9a0a4e285a3cd83c5d5e963b9f30919dbb5396f81b49bbff1a37e6af9"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-reader-0.1.15-darwin-x64.tar.gz"
      sha256 "8d2781feef2c95452f5ad47e4297a72fe874e0d9fe414a3e306bf8aa32ca376f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
