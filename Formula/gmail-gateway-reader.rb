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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-reader-0.1.29-darwin-arm64.tar.gz"
      sha256 "aa3be3fafa04c57f81a854d9dcfe102649ddbe06d9f20708cdbd170165386821"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-reader-0.1.29-darwin-x64.tar.gz"
      sha256 "42904fa261843e0c96ecb84c619a388902c0fd2330a5f94dd22676a7681703c4"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
