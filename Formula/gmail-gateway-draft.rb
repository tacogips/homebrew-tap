class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-draft-0.1.24-darwin-arm64.tar.gz"
      sha256 "1e8f923a0d92031401942b662f1f245ad42504bc47b2c9c9c85d026360ea8e31"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-draft-0.1.24-darwin-x64.tar.gz"
      sha256 "3a2bc6f7fdb9591b27f38b6d89eeba39973cf23ce5992683426ec61b488d3faa"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
