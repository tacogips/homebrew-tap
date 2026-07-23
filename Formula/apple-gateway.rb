class AppleGateway < Formula
  desc "macOS CLI and GraphQL bridge for Apple apps"
  homepage "https://github.com/tacogips/apple-gateway"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.4/apple-gateway-0.1.4-darwin-arm64.tar.gz"
      sha256 "e2b4d3c42e7f15df2ed69c0d7fe3c0c1003f0c7691da3872df0a612bd9515c4a"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.4/apple-gateway-0.1.4-darwin-x64.tar.gz"
      sha256 "62333386eed0293a7fce8aaf81707d54e95585dec40365aba0bdddec363b61c1"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.4", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
