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
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.6/google-analytics-gateway-admin-0.1.6-darwin-arm64.tar.gz"
      sha256 "efab3cb819a338a0918a52fb0e39b3b90ed24b1970c2d9e4e6dda20ba68beece"
    else
      url "https://github.com/tacogips/google-analytics-gateway/releases/download/v0.1.6/google-analytics-gateway-admin-0.1.6-darwin-x64.tar.gz"
      sha256 "cd497a4fc2cd0472efdea1ca246109aee254093f24ee231264f94dc038919557"
    end
  end

  def install
    bin.install "bin/google-analytics-gateway-admin"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/google-analytics-gateway-admin --help")
  end
end
