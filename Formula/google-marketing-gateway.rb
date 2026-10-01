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
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.4/google-marketing-gateway-0.1.4-darwin-arm64.tar.gz"
      sha256 "9bc6e76d623798f6e3faad149a3f9e4c7629d4e673e4bf033c5268db76f50536"
    else
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.4/google-marketing-gateway-0.1.4-darwin-x64.tar.gz"
      sha256 "580ff37ac9e201c2f773fae4ad0e2295ca6ea363b87ec86ff9b62e6e0217cb1d"
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
    assert_match "0.1.4", shell_output("#{bin}/google-marketing-gateway --version")
  end
end
