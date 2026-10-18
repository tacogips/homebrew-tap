class XGatewayReader < Formula
  desc "Read-only X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.11/x-gateway-0.1.11-darwin-arm64.tar.gz"
      sha256 "b68f23d14c9b6fbedc21c3d8166287a4efc4e630eba657d3e16fa0fce025b338"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.11/x-gateway-0.1.11-darwin-x64.tar.gz"
      sha256 "8e6d6747bb3240fdd631996c03a4a360cdc6fca9f81a02ff60e26c90ce5d72a1"
    end
  end

  def install
    bin.install "bin/x-gateway-reader"
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/x-gateway-reader version")
  end
end
