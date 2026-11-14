class XGatewayWriter < Formula
  desc "Write-capable X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.5/x-gateway-0.1.5-darwin-arm64.tar.gz"
      sha256 "265d6fcc249b34f72fae27da5b270e7ac5dd2691902f10736779710b88a68646"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.5/x-gateway-0.1.5-darwin-x64.tar.gz"
      sha256 "b2d2272f01cf8dcf7e7f9dc73b73dff7d14dded05d9da1749a4c75469f2388d2"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/x-gateway-writer version")
  end
end
