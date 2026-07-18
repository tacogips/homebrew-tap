class AppleGateway < Formula
  desc "macOS CLI and GraphQL bridge for Apple apps"
  homepage "https://github.com/tacogips/apple-gateway"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.2/apple-gateway-0.1.2-darwin-arm64.tar.gz"
      sha256 "7a99fce1d35481246f9b18ce6483d304376837f0a465f047356b886c4fe2fd33"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.2/apple-gateway-0.1.2-darwin-x64.tar.gz"
      sha256 "243a253f4f94aed37ace5a417bde854f41a2edfcea28b40158c63f089aa9ef24"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.2", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
