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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.8/apple-gateway-0.1.8-darwin-arm64.tar.gz"
      sha256 "edc638d2235773034834c6e6211f89e0bbeb45e3ea76f88cdb764b2562ac1c8d"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.8/apple-gateway-0.1.8-darwin-x64.tar.gz"
      sha256 "ef84d226fe88563f17387da02e839c8f6e5923c6b764474d840d5faae3a961dc"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.8", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
