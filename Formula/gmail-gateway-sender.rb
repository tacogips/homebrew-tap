class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-sender-0.1.14-darwin-arm64.tar.gz"
      sha256 "655c86b0fe9d90185643a1a25ac3aaedaa156bbc5a5341c76ccc2f735a772efd"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-sender-0.1.14-darwin-x64.tar.gz"
      sha256 "1e36f314932be613703f8c35ac5f93487b783672fd6fa4b864b4a8de10a0c743"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
