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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-draft-0.1.14-darwin-arm64.tar.gz"
      sha256 "cfd95843b8b8267b0eab74ade102e6edaf5addbf79e5268f5b7c8a5e538227aa"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-draft-0.1.14-darwin-x64.tar.gz"
      sha256 "193f182c1cb02ab3b6fd6513576031d909b7558a3b003aacdb8d88cf30e3aff7"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
