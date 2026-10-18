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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.10/apple-gateway-0.1.10-darwin-arm64.tar.gz"
      sha256 "be9c865fe5306590305c148d1978eb8e1c4c87f6a300783a54e58f6dcfab29a3"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.10/apple-gateway-0.1.10-darwin-x64.tar.gz"
      sha256 "31f771cf4d8597aef3f512f04c784db401509c5d15c0918e3be1afa4f8f1f06e"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.10", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
