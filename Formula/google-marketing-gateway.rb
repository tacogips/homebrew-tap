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
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.3/google-marketing-gateway-0.1.3-darwin-arm64.tar.gz"
      sha256 "c23ed0ca76ff6b3f80263e211dc3c2128ac2e38debc05ee8704dc40b2018e692"
    else
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.3/google-marketing-gateway-0.1.3-darwin-x64.tar.gz"
      sha256 "b9e9b22da8b30ff06137e6f82ba2baef3c36685039fff8470534f5940f811d16"
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
    assert_match "0.1.3", shell_output("#{bin}/google-marketing-gateway --version")
  end
end
