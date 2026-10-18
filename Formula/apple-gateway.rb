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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.14/apple-gateway-0.1.14-darwin-arm64.tar.gz"
      sha256 "f09471a3939ff71a8186dd11b89e38f8b9f8b36023db345bf2721c491c51e94c"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.14/apple-gateway-0.1.14-darwin-x64.tar.gz"
      sha256 "e804462eff02af8cdc41f99a8c9e9e39c5e62539f99afbfca9efcf829e7ea3d4"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.14", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.14", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
