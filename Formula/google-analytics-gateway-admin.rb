class GoogleAnalyticsGatewayAdmin < Formula
  desc "GraphQL gateway for Google Analytics and Tag Manager with admin access"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.1/google-analytics-gateway-admin-0.1.1-darwin-arm64.tar.gz"
      sha256 "988011bd0c781f56c33bad82abf0da292e557b822dd6e767e85e46b330c8d3b0"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.1/google-analytics-gateway-admin-0.1.1-darwin-x64.tar.gz"
      sha256 "36fb1fbb4c10bb2799d33965966de1bd510e924ca8303f7328fc894d7fdcd7cd"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-admin"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-admin --help")
  end
end
