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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.16/apple-gateway-0.1.16-darwin-arm64.tar.gz"
      sha256 "7976d89ee52d4fd03ea98ec891e752973abc6a73b1dd739e8beb9633589c030b"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.16/apple-gateway-0.1.16-darwin-x64.tar.gz"
      sha256 "a617af806a03d6c3d61abb2b792403a1a6ab4e0cc14ecddbd996f9fc97e5fd3d"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.16", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.16", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
