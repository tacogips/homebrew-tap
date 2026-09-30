class GoogleAnalyticsGatewayReader < Formula
  desc "Read-only GraphQL gateway for Google Analytics and Tag Manager"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.4/google-analytics-gateway-reader-0.1.4-darwin-arm64.tar.gz"
      sha256 "ad6d2af01512e25eb463202b1b707f2ff446cbc3322dc75c1dc9730637ce5fe6"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.4/google-analytics-gateway-reader-0.1.4-darwin-x64.tar.gz"
      sha256 "532f39e7b7d9a58c1f5bb9eb9d8313e3c0c87680e9477a66a4807ad1c470f408"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-reader --help")
  end
end
