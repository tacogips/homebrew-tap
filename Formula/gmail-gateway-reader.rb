class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.8/gmail-gateway-reader-0.1.8-darwin-arm64.tar.gz"
      sha256 "924cf0f3d146bbcb644d1589f28d08c04bc3163e8074467a9af89e8ce8895e4c"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.8/gmail-gateway-reader-0.1.8-darwin-x64.tar.gz"
      sha256 "ae1bc586d513ae4eb86c34d4dff2d94703fb27ac400d25be3d03a871def9202f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
