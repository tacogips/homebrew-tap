class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.9"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.9/gmail-gateway-draft-0.1.9-darwin-arm64.tar.gz"
      sha256 "f0c070a3f4a05ec61c916d7a9f01a6408c0b5a687f5acd14b69bec87ce2861e9"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.9/gmail-gateway-draft-0.1.9-darwin-x64.tar.gz"
      sha256 "fffac989a17df56fa428be269fda53d89602ba04c9caa88667d6f09a0a3b84bc"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
