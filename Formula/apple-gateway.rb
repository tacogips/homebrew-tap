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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.17/apple-gateway-0.1.17-darwin-arm64.tar.gz"
      sha256 "8a0140249ee2f129dab71578eee983e0a661d58a6bcee13862c118bd2a90c799"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.17/apple-gateway-0.1.17-darwin-x64.tar.gz"
      sha256 "0b614b67b0bdf98f6cba3aede25837118e54f37d8ce5236e78fd5c78df7426ba"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.17", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.17", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
