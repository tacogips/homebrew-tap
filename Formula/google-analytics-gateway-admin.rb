class GoogleAnalyticsGatewayAdmin < Formula
  desc "GraphQL gateway for Google Analytics and Tag Manager with admin access"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.5/google-analytics-gateway-admin-0.1.5-darwin-arm64.tar.gz"
      sha256 "bc63028cf48fce0bb7b1e9f37eb6d0fa0bc015cb78024b3ccaa7cfbcfdc0529a"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.5/google-analytics-gateway-admin-0.1.5-darwin-x64.tar.gz"
      sha256 "c05c7f5cf117b28d22df965b84c43c0c4b2096afa249a41ce56f388c3285dc4c"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-admin"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-admin --help")
  end
end
