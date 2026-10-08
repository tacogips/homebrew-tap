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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.6/google-analytics-gateway-reader-0.1.6-darwin-arm64.tar.gz"
      sha256 "12de03466cf591db9ed2a1326718c8a3d91561084e4a4415348cd9616c4996f2"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.6/google-analytics-gateway-reader-0.1.6-darwin-x64.tar.gz"
      sha256 "e09528e6edce196ed506f5c76b9d2e639785c461c479d97c18f2072e7e86c1fd"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-reader --help")
  end
end
