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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.11/apple-gateway-0.1.11-darwin-arm64.tar.gz"
      sha256 "a7739a433ab0d1130d6cb6977f1300b4995ed52653577737cf0d4194f41d1716"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.11/apple-gateway-0.1.11-darwin-x64.tar.gz"
      sha256 "104645c1da6cc9476a7d80a0ebd47a9e0c6515d2764b9bdd7025d36c936dd3ae"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.11", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
