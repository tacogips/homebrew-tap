class MailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.2/mail-gateway-sender-0.1.2-darwin-arm64.tar.gz"
      sha256 "e41cab39ea7dd8dc1c449df0c66635ed881448b6593b2c6228a5c76941aa51de"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.2/mail-gateway-sender-0.1.2-darwin-x64.tar.gz"
      sha256 "5b7d6edb203eb586c8bfce67febf4234708ee005b91e54e1c6cd100739e45310"
    end
  end

  def install
    bin.install "bin/mail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-sender --help")
  end
end
