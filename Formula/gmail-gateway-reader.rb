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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-reader-0.1.14-darwin-arm64.tar.gz"
      sha256 "9c7113aeaf4c2e14ea6ff52b5c9c6e49a664081e056f04355cecfbfe53447b4d"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-reader-0.1.14-darwin-x64.tar.gz"
      sha256 "4125f6bd95161492cfe558ff368e9e6803a4c09f44468fd83c4572fdfe59b6de"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
