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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-reader-0.1.20-darwin-arm64.tar.gz"
      sha256 "522ba83f3f93d44d726eb27b91087217a86e0990694d3223b15f972e4c77ccf7"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-reader-0.1.20-darwin-x64.tar.gz"
      sha256 "2e21461670241c55c5971254fd3d441c6a2a6eb826d64e4132818218e101a824"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
