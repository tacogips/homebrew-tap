class GmailGatewayThreads < Formula
  desc "Mailbox-mutating Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-threads-0.1.18-darwin-arm64.tar.gz"
      sha256 "bdca9936533b0fe8ca6ec407c3eec454b9fb3e4a0461a80b5c47ef66fcfc1697"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-threads-0.1.18-darwin-x64.tar.gz"
      sha256 "4cf579a4e1fdaee07f09d7d6d67fa0a2475ad24e399e8a56a48fae3279f076e0"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
