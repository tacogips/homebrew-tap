class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.9"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.9/gmail-gateway-sender-0.1.9-darwin-arm64.tar.gz"
      sha256 "4530ca24e11db8c67b1f690aa414721e95412f3362d625c3585a557c68354403"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.9/gmail-gateway-sender-0.1.9-darwin-x64.tar.gz"
      sha256 "3f86ef419ea35aeac9e0f415e7fd59372c44843c1bfec990c0b9d87962cc1fa9"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
