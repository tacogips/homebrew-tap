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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-threads-0.1.23-darwin-arm64.tar.gz"
      sha256 "38f61ba383a0e9d96efad67bf0c1922bc12789d72c6e2ff71f9139a11fa62916"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-threads-0.1.23-darwin-x64.tar.gz"
      sha256 "b94447d3cd9c87618479d4b67ba8bea5441bf9e893817df15425bb757453e705"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
