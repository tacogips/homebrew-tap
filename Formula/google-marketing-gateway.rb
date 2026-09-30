class GoogleMarketingGateway < Formula
  desc "Product-isolated CLI gateway for Google marketing APIs"
  homepage "https://github.com/tacogips/google-marketing-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.2/google-marketing-gateway-0.1.2-darwin-arm64.tar.gz"
      sha256 "703a310aaffe6002e8a9bd078adb01badc1c050a255ef0a1d6e5bbde498a38ed"
    else
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.2/google-marketing-gateway-0.1.2-darwin-x64.tar.gz"
      sha256 "40315561a0317618700e318c98f32480d239b7044d77d4e5768c1b0ac856b952"
    end
  end

  def install
    bin.install "bin/google-marketing-gateway"
    bin.install "bin/google-marketing-gateway-reader"
    bin.install "bin/google-marketing-gateway-writer"
    bin.install "bin/google-marketing-gateway-deleter"
    bin.install "bin/google-marketing-gateway-admin"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/google-marketing-gateway --version")
  end
end
