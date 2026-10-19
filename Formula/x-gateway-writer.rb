class XGatewayWriter < Formula
  desc "Write-capable X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.13/x-gateway-0.1.13-darwin-arm64.tar.gz"
      sha256 "b5967e045dc467a6378900e960f0d914272ad55d6620a6a1cbb8b036eeb9fc9c"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.13/x-gateway-0.1.13-darwin-x64.tar.gz"
      sha256 "82777cdfb8d9b7b43f95c11d37440686fa084b5e3139eded64f0eb62d747373c"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.13", shell_output("#{bin}/x-gateway-writer version")
  end
end
