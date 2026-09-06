class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-reader-0.1.11-darwin-arm64.tar.gz"
      sha256 "837b0eb513b0af586f923e25bc0ca02ee498410a18cc451b1d863ad9a1eae126"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-reader-0.1.11-darwin-x64.tar.gz"
      sha256 "2e3c61ab2727ee5d1f5affc1ab8f4f5862bee9b8fbbb92dcf784c7d8f2451061"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
