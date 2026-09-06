class GoogleAnalyticsGatewayReader < Formula
  desc "Read-only GraphQL gateway for Google Analytics and Tag Manager"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.1/google-analytics-gateway-reader-0.1.1-darwin-arm64.tar.gz"
      sha256 "23df8ddb1cc59e115be7c440688a839eacfe1a327a7bcca330b8263a8d5c0e85"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.1/google-analytics-gateway-reader-0.1.1-darwin-x64.tar.gz"
      sha256 "9379f987a78b6eb049bb7b2ddc024d99c448c7e8bc3b58f74af826b6b8af835b"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-reader --help")
  end
end
