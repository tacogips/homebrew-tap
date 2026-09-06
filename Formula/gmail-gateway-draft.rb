class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-draft-0.1.11-darwin-arm64.tar.gz"
      sha256 "892d7d9a3f02fcbf23a95ef751859dfed5a99fd0e9b64f6444093f2ad0bc94fa"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-draft-0.1.11-darwin-x64.tar.gz"
      sha256 "70ae4d8723ba02dbbef717632c07bf3161d83599a322f55e555d1b64f18f614b"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
