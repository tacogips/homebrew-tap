class XGatewayWriter < Formula
  desc "Write-capable X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.3/x-gateway-0.1.3-darwin-arm64.tar.gz"
      sha256 "8d4521f0a75700d6fb37c9ee9d6717c72473f7f2c1b3d0d4e312b75a66828c78"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.3/x-gateway-0.1.3-darwin-x64.tar.gz"
      sha256 "c755c727bcab72a2739d2bfa641112b3bcb15c002aa0147e9ad59c8e89bd7301"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/x-gateway-writer version")
  end
end
