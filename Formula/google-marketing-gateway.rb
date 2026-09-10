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
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.1/google-marketing-gateway-0.1.1-darwin-arm64.tar.gz"
      sha256 "aef8ca8fee48fb13b46b012442905ec7e6d8d5e8954fd24603cc074c8f704ffa"
    else
      url "https://github.com/tacogips/google-marketing-gateway/releases/download/v0.1.1/google-marketing-gateway-0.1.1-darwin-x64.tar.gz"
      sha256 "bdee3290250a54c19c91c275bd7655f4bb4cb161dbc1896877076a752c6b15de"
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
    assert_match "0.1.1", shell_output("#{bin}/google-marketing-gateway --version")
  end
end
