class GoogleAnalyticsGatewayWriter < Formula
  desc "GraphQL gateway for Google Analytics and Tag Manager with write access"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.2/google-analytics-gateway-writer-0.1.2-darwin-arm64.tar.gz"
      sha256 "07810bebf0db4b6a6613693aa9058cd8544865ea5512ec67ddb9481bb4192047"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.2/google-analytics-gateway-writer-0.1.2-darwin-x64.tar.gz"
      sha256 "f1164482d4212a257815797d3abf151afe0455c8c68d8294bb026a85eb757ef2"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-writer"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-writer --help")
  end
end
