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
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.9/x-gateway-0.1.9-darwin-arm64.tar.gz"
      sha256 "edbd40ac71d15970ae698283fe6deb584e6299a64c2d459fcb7e590f9e628b95"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.9/x-gateway-0.1.9-darwin-x64.tar.gz"
      sha256 "7d071eba811166a165a6a2c0574726559e6b83dc564679871e5a8d5a6d4f6a48"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/x-gateway-writer version")
  end
end
