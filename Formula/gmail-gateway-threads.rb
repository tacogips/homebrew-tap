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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-threads-0.1.20-darwin-arm64.tar.gz"
      sha256 "62d589641c39c5f7a3afa7a3bd0698ef71fa650f7bbf9e53467e34d0260fb7d4"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.20/gmail-gateway-threads-0.1.20-darwin-x64.tar.gz"
      sha256 "bd99d922e4660fbbb159c19fabe3c76fddf8d290ed96a9f639e3ed6bbd6d1bfe"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
