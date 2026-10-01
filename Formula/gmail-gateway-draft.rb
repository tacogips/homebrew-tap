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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-draft-0.1.17-darwin-arm64.tar.gz"
      sha256 "aaa181c588b4d76ffe16281bf7991c443dafac54770028b767c12cf912bc96ac"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-draft-0.1.17-darwin-x64.tar.gz"
      sha256 "9749c6f6d46b69c0586884743630fb0fc6c0b7240651a9988583044680e55c4a"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
