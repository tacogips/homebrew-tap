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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-reader-0.1.12-darwin-arm64.tar.gz"
      sha256 "30b9cdb29e7ee0740a19efa07fae4f49c82819a5d1317509827b2079d53659a2"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-reader-0.1.12-darwin-x64.tar.gz"
      sha256 "29cc8a14a6e1d95cb994713bd19d3594d70b05f8538d644f6dc7c3b7e8327217"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
