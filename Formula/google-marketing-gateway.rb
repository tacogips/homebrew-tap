class GoogleMarketingGateway < Formula
  desc "Product-isolated CLI gateway for Google marketing APIs"
  homepage "https://github.com/tacogips/google-marketing-gateway"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.0/google-marketing-gateway-0.1.0-darwin-arm64.tar.gz"
      sha256 "1c4b1a23d72c3f82807f56a633fea15056ad6bcff5a9f881da7b6ec5860a30d0"
    else
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.0/google-marketing-gateway-0.1.0-darwin-x64.tar.gz"
      sha256 "298f8dd40f07dd15c7f9011ce9c8add4e31cedcc0181274141d331c0afb2c155"
    end
  end

  def install
    bin.install "bin/google-marketing-gateway"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/google-marketing-gateway --version")
  end
end
