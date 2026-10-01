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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.5/google-analytics-gateway-reader-0.1.5-darwin-arm64.tar.gz"
      sha256 "5572c63a1e3f5aea41db775f5af46c7734c8b2236ee09a1dea8e019edade9d8f"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.5/google-analytics-gateway-reader-0.1.5-darwin-x64.tar.gz"
      sha256 "744267f6ade1bb897500d87833b79de1fa11ba82a8bda16e53390139209054fa"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-reader --help")
  end
end
