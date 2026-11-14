class MailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.5/mail-gateway-sender-0.1.5-darwin-arm64.tar.gz"
      sha256 "39fc093d9c2f9c92c173c6673987b80c90d7c0aa35caf1548552083ee346c232"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.5/mail-gateway-sender-0.1.5-darwin-x64.tar.gz"
      sha256 "23b9a512f49f0dc08cfd68c2620f6e25db216c883e914cb1ca82c8eb6054d0f8"
    end
  end

  def install
    bin.install "bin/mail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-sender --help")
  end
end
