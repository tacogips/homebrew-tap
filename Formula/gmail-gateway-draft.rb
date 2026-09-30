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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-draft-0.1.16-darwin-arm64.tar.gz"
      sha256 "ae2e9f2f5c1a81b3a318916bd16544b4111b5e8ea033ef87d036b2a9a0ad3ae7"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-draft-0.1.16-darwin-x64.tar.gz"
      sha256 "be1aaab31ce0f69ed4c744e380f14051544f5f0ad1a4aac88c4d59924c97009d"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
