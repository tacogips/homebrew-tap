class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-reader-0.1.26-darwin-arm64.tar.gz"
      sha256 "dd4f0a638c7024139b48ab5b5ea956dc9be4a70c371a8c58c3dc07f8eada6b04"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-reader-0.1.26-darwin-x64.tar.gz"
      sha256 "60f366dffed117d4cb79f6860cdb8534f6f0607e86f46e109814c2af3256fc11"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
