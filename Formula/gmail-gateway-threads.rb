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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-threads-0.1.29-darwin-arm64.tar.gz"
      sha256 "5236153f5d41df88dc1b4d255630aecf45cd9605d9b44a327a8745643d026b98"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-threads-0.1.29-darwin-x64.tar.gz"
      sha256 "0ba775316b0e6120a4dcb70979695a456abb4cce339123479d15fc857015fb3c"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
