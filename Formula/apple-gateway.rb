class AppleGateway < Formula
  desc "macOS CLI and GraphQL bridge for Apple apps"
  homepage "https://github.com/tacogips/apple-gateway"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.5/apple-gateway-0.1.5-darwin-arm64.tar.gz"
      sha256 "924cc43e67bac6c544de013aaadf305304a8676e25e6f4348f701d7c6670d0e2"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.5/apple-gateway-0.1.5-darwin-x64.tar.gz"
      sha256 "02d5a6195020ebd9aab5891ed5c55ae7a8527e37d94ed87a222293bbaa6c240c"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.5", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
