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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-reader-0.1.13-darwin-arm64.tar.gz"
      sha256 "823af6e210f0b6cd71a84bd37e55e49fa921fa4c54d51bab1f4cdec313909ed5"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-reader-0.1.13-darwin-x64.tar.gz"
      sha256 "c28e9f1f76c145141b1a26338c0a11213de5074962673a4294a889a138c4fc91"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
