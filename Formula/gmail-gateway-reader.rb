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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-reader-0.1.18-darwin-arm64.tar.gz"
      sha256 "862bbfb88eda33d40d31af290135e5df91f12e21d3a5b123bad95a273df0f017"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-reader-0.1.18-darwin-x64.tar.gz"
      sha256 "516aa8704e92e214403722c942b4f8445fcd5f946a4689dc394bc2acefc2df64"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
