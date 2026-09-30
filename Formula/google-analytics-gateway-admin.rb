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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.3/google-analytics-gateway-admin-0.1.3-darwin-arm64.tar.gz"
      sha256 "379585ad017ec58ce12d9e77b8a6cabc1e4e3ba4d1899f6b5a6c59043e3dda11"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.3/google-analytics-gateway-admin-0.1.3-darwin-x64.tar.gz"
      sha256 "8cf3467dca187f2f93c781d477f3ac04c90f303ba589463afe05a9ed03f79338"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-admin"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-admin --help")
  end
end
