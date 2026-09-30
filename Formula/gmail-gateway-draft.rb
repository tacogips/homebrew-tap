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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-draft-0.1.15-darwin-arm64.tar.gz"
      sha256 "13e5104a02ce782dfc44d1b203e905ebeab16b7e39029f8bffcb7d916e5456ad"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-draft-0.1.15-darwin-x64.tar.gz"
      sha256 "14bdc5b209812157bdaaadcf4a69a991f5d092a87b72e0491c3e79e3314345e9"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
