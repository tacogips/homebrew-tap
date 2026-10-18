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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-reader-0.1.22-darwin-arm64.tar.gz"
      sha256 "383e8b341cbd0d2f29285841fc85479ab49b49978624c841fe1fcfb5c63f238f"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-reader-0.1.22-darwin-x64.tar.gz"
      sha256 "e63c9f6a038f4d56304378dd732480c1552a5b48d6b118b568b007ae048aebc5"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
