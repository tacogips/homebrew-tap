class MailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.5/mail-gateway-draft-0.1.5-darwin-arm64.tar.gz"
      sha256 "5b67f115db252e4203151b4ab6a314a5373f1c1d3e37a1895d5e6419cbfd61f3"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.5/mail-gateway-draft-0.1.5-darwin-x64.tar.gz"
      sha256 "95452b470fd61e2a7f5f26c6566ae2d74f6d83f3455a49871a3e2288dc6e6c82"
    end
  end

  def install
    bin.install "bin/mail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-draft --help")
  end
end
