class GoogleAnalyticsGatewayWriter < Formula
  desc "GraphQL gateway for Google Analytics and Tag Manager with write access"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.1/google-analytics-gateway-writer-0.1.1-darwin-arm64.tar.gz"
      sha256 "7211b117eeb03546693ff8c6c04ee1dbe174665bfb6f5b0aaac7e846d68e9d03"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.1/google-analytics-gateway-writer-0.1.1-darwin-x64.tar.gz"
      sha256 "ec677ee880fe829c2481f1b070c9bc14166eb972f8c01822203cc5b3751b5d74"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-writer"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-writer --help")
  end
end
