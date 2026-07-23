class AppleGateway < Formula
  desc "macOS CLI and GraphQL bridge for Apple apps"
  homepage "https://github.com/tacogips/apple-gateway"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.3/apple-gateway-0.1.3-darwin-arm64.tar.gz"
      sha256 "59d0f91cddd25516d7dd3a721998f7dc8733e0914bee396d6a02eb205efcdc29"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.3/apple-gateway-0.1.3-darwin-x64.tar.gz"
      sha256 "d9dae1f14469f77b456cf1c1f288c548844e0fceaf39c97ff4c3658a0365bde7"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.3", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
