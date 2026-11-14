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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-draft-0.1.29-darwin-arm64.tar.gz"
      sha256 "bbffe922d2946ef974b3b5a22cb9d5ff29b4ca87380b235e3ed49b5a23fc00c8"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-draft-0.1.29-darwin-x64.tar.gz"
      sha256 "c76890c91fac66418020f3ea7da7ec3a5a0faecdda83db4225570195efb90fd4"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
