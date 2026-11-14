class AppleGateway < Formula
  desc "macOS CLI and GraphQL bridge for Apple apps"
  homepage "https://github.com/tacogips/apple-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.6/apple-gateway-0.1.6-darwin-arm64.tar.gz"
      sha256 "320eae1b2f3ebaf1800666c51a55eeeb22011ffbc071cfff10c56ddb39167e9a"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.6/apple-gateway-0.1.6-darwin-x64.tar.gz"
      sha256 "567cb2d361adea5f03a45236121d08a7dd1aa0b16bc4b38c98089741f25220de"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.6", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
