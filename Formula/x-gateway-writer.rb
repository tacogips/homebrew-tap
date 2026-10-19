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
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.15/x-gateway-0.1.15-darwin-arm64.tar.gz"
      sha256 "82ee24419795566a56c981c2871bda6d50bb831e7c211b53ddfd47be35642b4a"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.15/x-gateway-0.1.15-darwin-x64.tar.gz"
      sha256 "6b43ac581b265d089d3958c8f1a8c0fc1ba451cc65cf6cdf7b07e7a5cc27cebc"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.15", shell_output("#{bin}/x-gateway-writer version")
  end
end
