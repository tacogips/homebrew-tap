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
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.16/x-gateway-0.1.16-darwin-arm64.tar.gz"
      sha256 "0162c3b24faa790081799f7cb1c8ab92c5223459a3bc6ec4d8b21052475452ac"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.16/x-gateway-0.1.16-darwin-x64.tar.gz"
      sha256 "b8e7704b50ae7b432e9aa74f2a3b4867b066fba27007bc70a874ba1355a45ad0"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.16", shell_output("#{bin}/x-gateway-writer version")
  end
end
