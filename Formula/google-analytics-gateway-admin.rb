class GoogleAnalyticsGatewayAdmin < Formula
  desc "GraphQL gateway for Google Analytics and Tag Manager with admin access"
  homepage "https://github.com/tacogips/google-analytics-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.2/google-analytics-gateway-admin-0.1.2-darwin-arm64.tar.gz"
      sha256 "629a3f784c5c7e8454eeecda109a0477a44876a03af0c4ce28f0f32b073e9ef0"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.2/google-analytics-gateway-admin-0.1.2-darwin-x64.tar.gz"
      sha256 "48a6c96784175878948de059af2b0a0a5ef2fac83ea37063ce2ffbe62992f685"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-admin"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-admin --help")
  end
end
