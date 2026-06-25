class MailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.3/mail-gateway-sender-0.1.3-darwin-arm64.tar.gz"
      sha256 "3660d2439d28ec87b9acbf4b34e5f52c087bdd9a777d8f3befbf6589ba06ca12"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.3/mail-gateway-sender-0.1.3-darwin-x64.tar.gz"
      sha256 "143c86ccd8745d2ab78a4ffbd93cb728e6458780ba87dd71f8fa2293344fa6ac"
    end
  end

  def install
    bin.install "bin/mail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-sender --help")
  end
end
