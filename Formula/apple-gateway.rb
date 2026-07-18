class AppleGateway < Formula
  desc "macOS CLI and GraphQL bridge for Apple apps"
  homepage "https://github.com/tacogips/apple-gateway"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.0/apple-gateway-0.1.0-darwin-arm64.tar.gz"
      sha256 "4419dd6f2c7c9872a02412cea4021a8e750383212034948df676d9424717646d"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.0/apple-gateway-0.1.0-darwin-x64.tar.gz"
      sha256 "a643c13b0f0425230008d71d9f7089f4ecc73e7bfe15aba9be2f4a1ecc0701c3"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.0", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
