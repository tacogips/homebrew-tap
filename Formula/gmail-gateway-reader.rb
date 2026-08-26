class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.9"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.9/gmail-gateway-reader-0.1.9-darwin-arm64.tar.gz"
      sha256 "429157f56159a5e901f89a256d0df9a02a6c34b1fb4c379856d81073b2e1300a"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.9/gmail-gateway-reader-0.1.9-darwin-x64.tar.gz"
      sha256 "75f9cbf32dcd25aa75a54ae8b7db768de697a7523d5a7f055d60cfc4461f4827"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
