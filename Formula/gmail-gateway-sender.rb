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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-sender-0.1.16-darwin-arm64.tar.gz"
      sha256 "a1cee81802cb4a1e6c2803744514393c9f6f665b95eb5f22a35eb2cf6073bf24"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-sender-0.1.16-darwin-x64.tar.gz"
      sha256 "eca32bbb553b3fe58a00353c2906c1febb547928053b6ac0a2f0daa121b8e285"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
