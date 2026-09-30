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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.4/google-analytics-gateway-writer-0.1.4-darwin-arm64.tar.gz"
      sha256 "41ce5b6a36f4af7a612456038cec9d928f9e56f91b5ae8ca0640f22c6fcf5e12"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.4/google-analytics-gateway-writer-0.1.4-darwin-x64.tar.gz"
      sha256 "c62495c64242b64a7ee1f2c3bedd43123d5720ee74f454eccd5c163441f5fb95"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-writer"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-writer --help")
  end
end
