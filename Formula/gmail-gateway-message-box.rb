class GmailGatewayMessageBox < Formula
  desc "Mail-ingesting Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-message-box-0.1.22-darwin-arm64.tar.gz"
      sha256 "57aa68edabbd1fbf8e01dccec620322d3796314fa0464699bf75a8854e39d9ca"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-message-box-0.1.22-darwin-x64.tar.gz"
      sha256 "82cb20b7e8057367892b896370b76cf51cfc76fbd12c73b55f020790a0e647af"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
