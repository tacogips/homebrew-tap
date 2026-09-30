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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.4/google-analytics-gateway-admin-0.1.4-darwin-arm64.tar.gz"
      sha256 "68cfc7c76bae8971f99a7e6db7da92de5098fd80a69854af89b16ce6b7ff2b4c"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.4/google-analytics-gateway-admin-0.1.4-darwin-x64.tar.gz"
      sha256 "fa576bd6f2cf2e007486f4867fe8498d96e1229fc44f9d272c444ef4358275c5"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-admin"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-admin --help")
  end
end
