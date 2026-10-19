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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-draft-0.1.25-darwin-arm64.tar.gz"
      sha256 "113ea30586e59d9028183dcca3d7d596ba9971833e8590bbe10e4be069cd647a"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-draft-0.1.25-darwin-x64.tar.gz"
      sha256 "35bf7fb9049f36e8d334e14f0a9f60cd1cfd070ceb4cde10735c695f45d0da0f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
