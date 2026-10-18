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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-draft-0.1.21-darwin-arm64.tar.gz"
      sha256 "5cd7e7a9a8eefb7d10bc6185edcb7b09b2c02dd62840b16294c43cff30c36ee8"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-draft-0.1.21-darwin-x64.tar.gz"
      sha256 "ec8c9857527cd77424c1ee19d65c75941a73cb9dd6035732ecd9ff0a51dd8c71"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
