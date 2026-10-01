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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-reader-0.1.17-darwin-arm64.tar.gz"
      sha256 "d1a9adc32bac07dfc6d6f68b7722ea518ef873e55698b5796e7ba69c2b81f1bc"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-reader-0.1.17-darwin-x64.tar.gz"
      sha256 "d12c49eb7821bef8da30dff09b81946a25813b4e97adea8e91f95ca5e32b7b6d"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
