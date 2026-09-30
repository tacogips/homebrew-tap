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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-threads-0.1.15-darwin-arm64.tar.gz"
      sha256 "97c3b725ca442deb5848a939d093df08cd1d6e7eabf0ecd299600ca103c506f1"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-threads-0.1.15-darwin-x64.tar.gz"
      sha256 "95857824cbd2862c5dace96be414c1c55a3c41bbace1d63e387beec5ebaebf51"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
