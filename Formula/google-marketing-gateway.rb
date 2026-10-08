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
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.5/google-marketing-gateway-0.1.5-darwin-arm64.tar.gz"
      sha256 "126f1b80aad86f6cc9d605b56b8f21d747e93c21cb56d596549b2500cc336900"
    else
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.5/google-marketing-gateway-0.1.5-darwin-x64.tar.gz"
      sha256 "e95988de3b615b158d4ea1f74712d96bce51aa2b727a0892c3b1082f34d85d8e"
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
    assert_match "0.1.5", shell_output("#{bin}/google-marketing-gateway --version")
  end
end
