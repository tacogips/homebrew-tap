class MailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.4/mail-gateway-reader-0.1.4-darwin-arm64.tar.gz"
      sha256 "3d254d628155211a5c2f48050a882a1fe91e98324386e1a714ff6680668464b6"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.4/mail-gateway-reader-0.1.4-darwin-x64.tar.gz"
      sha256 "e1e4dc95c006447d79cf75fda3fb060834ffae57683de1a590b073ab2ae3e73a"
    end
  end

  def install
    bin.install "bin/mail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-reader --help")
  end
end
