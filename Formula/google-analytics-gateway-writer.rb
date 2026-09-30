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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.3/google-analytics-gateway-writer-0.1.3-darwin-arm64.tar.gz"
      sha256 "ecbe03f1e41e272b6c80dc7931bfe609f09e3461b72b67d0105511c24d37053f"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.3/google-analytics-gateway-writer-0.1.3-darwin-x64.tar.gz"
      sha256 "67f23a0832916398529e35979b4e33a15c6dbff3a10f3268dc436a661a2f60c1"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-writer"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-writer --help")
  end
end
