class AppleGateway < Formula
  desc "macOS CLI and GraphQL bridge for Apple apps"
  homepage "https://github.com/tacogips/apple-gateway"
  version "0.1.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.7/apple-gateway-0.1.7-darwin-arm64.tar.gz"
      sha256 "62cc661cce06c915eeab6a95dc747d5956d8534d1d80863ce262ba629c0cdeee"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.7/apple-gateway-0.1.7-darwin-x64.tar.gz"
      sha256 "4e24dad1ead44132baeaf2de6fa466230e80d8f916d6571dffe64e402866a9dd"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.7", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
