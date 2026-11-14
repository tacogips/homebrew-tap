class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-sender-0.1.26-darwin-arm64.tar.gz"
      sha256 "9b2723af1b0eb349670e4f5aeeb6aa7365772aa89597c17e963172220ec9a235"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-sender-0.1.26-darwin-x64.tar.gz"
      sha256 "0b4dc0a6f7ce7c83c0efa93111630c1e3df3c139ce6ade09b76f6b7670e61ef3"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
