class MailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.6/mail-gateway-reader-0.1.6-darwin-arm64.tar.gz"
      sha256 "4bebcbbfabf5d56728565bd4e7758e947e140f20e45599451c76a951d63dbc29"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.6/mail-gateway-reader-0.1.6-darwin-x64.tar.gz"
      sha256 "b68eb6f2be076690e40d01785835d10bec5c705fe4478232fdc3068d5d7e9a3e"
    end
  end

  def install
    bin.install "bin/mail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-reader --help")
  end
end
