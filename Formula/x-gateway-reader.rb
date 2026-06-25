class XGatewayReader < Formula
  desc "Read-only X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.2/x-gateway-0.1.2-darwin-arm64.tar.gz"
      sha256 "84c392d5a0aa5e672202d71513cb0065e3e64a7fcc6ceb10630201338b4590c1"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.2/x-gateway-0.1.2-darwin-x64.tar.gz"
      sha256 "074e3d0d34661a6fa2e64c3d280c11674f9d65936987fad5199bdee10fd1e392"
    end
  end

  def install
    bin.install "bin/x-gateway-reader"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/x-gateway-reader version")
  end
end
