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
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.12/x-gateway-0.1.12-darwin-arm64.tar.gz"
      sha256 "0fbfda55f33afa88ca346ce8cbf3c6f211301c5428ef8a10bfa1a750a51bfbbd"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.12/x-gateway-0.1.12-darwin-x64.tar.gz"
      sha256 "f11507c5cfedf3a8e193cd46a87f2fc84ed1dfc93799b5d2f5611eaa095f9daa"
    end
  end

  def install
    bin.install "bin/x-gateway-reader"
  end

  test do
    assert_match "0.1.12", shell_output("#{bin}/x-gateway-reader version")
  end
end
