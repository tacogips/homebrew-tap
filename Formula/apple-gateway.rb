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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.13/apple-gateway-0.1.13-darwin-arm64.tar.gz"
      sha256 "1dcd0702ac3dd9a20952918d598ad72783b19db5cc502a2aa9d5ca860395694e"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.13/apple-gateway-0.1.13-darwin-x64.tar.gz"
      sha256 "2670062a49ddacfc804a4d6c5478a4e42709a6a4263fb876fc0d93f54f0b66dc"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.13", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.13", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
