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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.18/apple-gateway-0.1.18-darwin-arm64.tar.gz"
      sha256 "a637a5e182e4fa8b1ebba6ce739737d5d58b138b55648c543df0f00f11e6359d"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.18/apple-gateway-0.1.18-darwin-x64.tar.gz"
      sha256 "a7b13c990f685442425d236d22b186d30983950f3ea7152fd78bd29f37c85110"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.18", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.18", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
