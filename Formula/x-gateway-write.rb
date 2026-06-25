class XGatewayWrite < Formula
  desc "Write-capable X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.1/x-gateway-0.1.1-darwin-arm64.tar.gz"
      sha256 "9e22c43c4e864161e87fb0a3b66b3d70eaa4a34abd5c2bd838e3d78144a04306"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.1/x-gateway-0.1.1-darwin-x64.tar.gz"
      sha256 "c5eb3284315d020f06a4c7943f3b4c9c333d85427aa8c5a4423b6d88402c6bdd"
    end
  end

  def install
    bin.install "bin/x-gateway-write"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/x-gateway-write version")
  end
end
