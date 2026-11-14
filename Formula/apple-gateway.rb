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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.19/apple-gateway-0.1.19-darwin-arm64.tar.gz"
      sha256 "5348bc30feab9b6d5452723cf623faa13befeff7d0ccf85c20395c4d9ae59259"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.19/apple-gateway-0.1.19-darwin-x64.tar.gz"
      sha256 "18e9e47af9c211c9aaf1bfd8aa29aee2d2d50778bb7f2d8680864b5838b3570d"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.19", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.19", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
