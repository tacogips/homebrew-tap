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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-draft-0.1.18-darwin-arm64.tar.gz"
      sha256 "9ccad506c946dd3bfdb64cfe6f808978892af567eb370895492a2cb280d1e5f5"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-draft-0.1.18-darwin-x64.tar.gz"
      sha256 "9a91308702365d333118c89de54c0e7093af07d482e80c3b33b6ba476deba02f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
