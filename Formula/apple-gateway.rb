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
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.12/apple-gateway-0.1.12-darwin-arm64.tar.gz"
      sha256 "544158b13b48cc8f9d0957d9a618509ed71ba23acfe90bbd4a3d7ef957d1e62e"
    else
      url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.12/apple-gateway-0.1.12-darwin-x64.tar.gz"
      sha256 "b9e3a1c9470d9931439973dc8816c36213467355f297f4603cfe4c63a1e6a947"
    end
  end

  def install
    bin.install "bin/apple-gateway"
    bin.install "bin/apple-gateway-reader"
    libexec.install "libexec/AppleGatewayNotifier.app"
  end

  test do
    assert_match "0.1.12", shell_output("#{bin}/apple-gateway --version")
    assert_match "0.1.12", shell_output("#{bin}/apple-gateway-reader --version")
    assert_path_exists libexec/"AppleGatewayNotifier.app"
  end
end
