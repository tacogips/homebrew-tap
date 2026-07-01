class MailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.4/mail-gateway-draft-0.1.4-darwin-arm64.tar.gz"
      sha256 "d90764c8862e713ab51e5fac3425aae02dc77010aa7741436351a1fe9cb1bf14"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.4/mail-gateway-draft-0.1.4-darwin-x64.tar.gz"
      sha256 "efba573b71dda88eeed283d4c4c3659aec9a0bcdf8eff860982b4015e620f4a2"
    end
  end

  def install
    bin.install "bin/mail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-draft --help")
  end
end
