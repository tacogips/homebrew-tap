class MailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.2/mail-gateway-reader-0.1.2-darwin-arm64.tar.gz"
      sha256 "95df0cdcee9518af80df7dae22dbdf12267a9cfabf2e61b5a17c6d22847f9125"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.2/mail-gateway-reader-0.1.2-darwin-x64.tar.gz"
      sha256 "f229954df9a520f76e6868e10629676574a29ba76d0657f2187d076e2f4046b0"
    end
  end

  def install
    bin.install "bin/mail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-reader --help")
  end
end
