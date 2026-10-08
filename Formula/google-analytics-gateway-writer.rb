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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.6/google-analytics-gateway-writer-0.1.6-darwin-arm64.tar.gz"
      sha256 "a33597d2aec1aeea4d394f75684dd40dd771549a56133428837f31f14e4b6d39"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.6/google-analytics-gateway-writer-0.1.6-darwin-x64.tar.gz"
      sha256 "01811fda0c946bb568f3ffaea7fe1a7775aa761602e2f351f1db55b5c7518f94"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-writer"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-writer --help")
  end
end
