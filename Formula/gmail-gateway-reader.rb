class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-reader-0.1.21-darwin-arm64.tar.gz"
      sha256 "028b91abee2ec2b76b0cb1ab1a17103ba89616ebccc511c9712adbf716a97b5b"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-reader-0.1.21-darwin-x64.tar.gz"
      sha256 "389d875c9f261f7f282f58a3f2281f4145dd6ce487786275cb7b2b85da30a2fd"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
