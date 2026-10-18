class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-draft-0.1.20-darwin-arm64.tar.gz"
      sha256 "91caac82ef318b0443fe6f6d46d341db847d0853c1b63507fd4c4e33834671f2"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-draft-0.1.20-darwin-x64.tar.gz"
      sha256 "37ddf31aa7d2f1d678e0a369c650b4792fdca28f2792fe88910d4ba4399cfa39"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
