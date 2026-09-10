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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.2/google-analytics-gateway-reader-0.1.2-darwin-arm64.tar.gz"
      sha256 "7a00daf75fb1a6f7198469c3d08bd184433852a62bc9367dbd60ea9eb02feb5f"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.2/google-analytics-gateway-reader-0.1.2-darwin-x64.tar.gz"
      sha256 "1a53d07d621684d2b6564d1a893c0dac381108d35b9af26df5756a51b7a1b684"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-reader --help")
  end
end
