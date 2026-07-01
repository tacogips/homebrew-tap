class MailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.4/mail-gateway-sender-0.1.4-darwin-arm64.tar.gz"
      sha256 "d46efb1ea3f1238b37514abb3625daf442a854a805dd5feea73b932ddaa5f071"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.4/mail-gateway-sender-0.1.4-darwin-x64.tar.gz"
      sha256 "a5c04527dadf19b7536a532ead72f95275a0fe1e98fee2b4b8fad9a978d6d689"
    end
  end

  def install
    bin.install "bin/mail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-sender --help")
  end
end
