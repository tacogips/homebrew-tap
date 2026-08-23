class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.7/gmail-gateway-draft-0.1.7-darwin-arm64.tar.gz"
      sha256 "174fc45f6faa8b0ec96b1207ddc51f6fc4c28cb671294a693fa131d19ae0da0b"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.7/gmail-gateway-draft-0.1.7-darwin-x64.tar.gz"
      sha256 "4fdb5be5e961580a690ea374fa376d5df7afcce9f16fe1fc18818340ace3c154"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
