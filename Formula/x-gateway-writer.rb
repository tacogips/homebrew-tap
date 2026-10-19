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
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.14/x-gateway-0.1.14-darwin-arm64.tar.gz"
      sha256 "7d5ff817f993aad8c879e40c48a2cf02c252a43361652ed8a570c0b4021b23d2"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.14/x-gateway-0.1.14-darwin-x64.tar.gz"
      sha256 "c202f044e4be149d276512c33461edad08c1359222c04ded9080d0a19c3ccaad"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.14", shell_output("#{bin}/x-gateway-writer version")
  end
end
