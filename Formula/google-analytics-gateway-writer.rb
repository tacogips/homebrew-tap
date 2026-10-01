class GoogleAnalyticsGatewayWriter < Formula
  desc "GraphQL gateway for Google Analytics and Tag Manager with write access"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.5/google-analytics-gateway-writer-0.1.5-darwin-arm64.tar.gz"
      sha256 "37b639650b2110da79f73c7492867d935f9b418f5cb2eaf6fab9d4f7bc0d5447"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.5/google-analytics-gateway-writer-0.1.5-darwin-x64.tar.gz"
      sha256 "cd59f5c035a0b0ab660016bf6e481dd7645dcf1d8cbc4d2d947972ff3c8ce64d"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-writer"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-writer --help")
  end
end
