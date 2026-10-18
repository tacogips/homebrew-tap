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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.15/apple-gateway-0.1.15-darwin-arm64.tar.gz"
      sha256 "014ce5217ef65ad29009a9488ad55ec550627541a2178d5b805511ff89d336a3"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.15/apple-gateway-0.1.15-darwin-x64.tar.gz"
      sha256 "57319c7413442e57017e64ad3b247890ff5d0079ea5c35bb16b7509595796eba"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.15", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.15", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
