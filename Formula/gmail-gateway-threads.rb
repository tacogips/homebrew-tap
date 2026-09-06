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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-threads-0.1.12-darwin-arm64.tar.gz"
      sha256 "a702f638ed1cf3f4af8c56efe9e0605e03563d82f368fa480f4012b997e67312"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-threads-0.1.12-darwin-x64.tar.gz"
      sha256 "0d7d178a3eb8f9c367ba975243961ec82cd5fe43751391d3741114360cbfb990"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
