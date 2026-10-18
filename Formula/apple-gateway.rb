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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.9/apple-gateway-0.1.9-darwin-arm64.tar.gz"
      sha256 "7d4434d5cfff12de09d0d846de16722552a6a54a7159d4f1e86b842902a10eb0"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.9/apple-gateway-0.1.9-darwin-x64.tar.gz"
      sha256 "4f3c01005f4a68692c1228efa4db97924bbe6741d1b651301147b5a5bd5d029c"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.9", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
