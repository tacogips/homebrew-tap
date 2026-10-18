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
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.7/x-gateway-0.1.7-darwin-arm64.tar.gz"
      sha256 "de6c6b02cdd3bc091439717eebce357e6f81837abca2978747a22dc4916cec0f"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.7/x-gateway-0.1.7-darwin-x64.tar.gz"
      sha256 "670022411abeb6772e45fb9909a3b4c6af143a842f31ffc7fce45c453c770e9f"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/x-gateway-writer version")
  end
end
