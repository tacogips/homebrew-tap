class GoogleAnalyticsGatewayReader < Formula
  desc "Read-only GraphQL gateway for Google Analytics and Tag Manager"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.3/google-analytics-gateway-reader-0.1.3-darwin-arm64.tar.gz"
      sha256 "d94ced17866361fae18893e0d5574fb773566faddf308add6ea6dcb32fed61db"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.3/google-analytics-gateway-reader-0.1.3-darwin-x64.tar.gz"
      sha256 "1931b7cde24afe79a5d7f9f226ccfcd17e363ee14dbb87bbdbb48d1de5f98b7a"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-reader --help")
  end
end
