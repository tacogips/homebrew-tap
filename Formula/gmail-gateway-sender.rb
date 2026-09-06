class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.10"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-sender-0.1.10-darwin-arm64.tar.gz"
      sha256 "7a8c711b4304340485d99f5c668ee907e32c8c3cffdc3c641b3767cbaee4f865"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-sender-0.1.10-darwin-x64.tar.gz"
      sha256 "a369458f927455bc93e6b5a1a80fb9b63bdb229d4e60cb241b57e967b94c6f22"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
