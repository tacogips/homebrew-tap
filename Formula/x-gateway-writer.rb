class XGatewayWriter < Formula
  desc "Write-capable X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  version "0.1.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.6/x-gateway-0.1.6-darwin-arm64.tar.gz"
      sha256 "4d134317e311310c44450b0616fc875cfd8157670df4224d99e0555acad7ea6f"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.6/x-gateway-0.1.6-darwin-x64.tar.gz"
      sha256 "95eb66b29115739e5ec7d488e892d6035470128aa887a8a05ed20b1f9bf0c0cb"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/x-gateway-writer version")
  end
end
