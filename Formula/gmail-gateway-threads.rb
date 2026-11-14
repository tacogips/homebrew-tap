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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-threads-0.1.26-darwin-arm64.tar.gz"
      sha256 "0ed07601270c81c3441c7bc80730d5365e5ff8392df6c4f0260056b066071c13"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-threads-0.1.26-darwin-x64.tar.gz"
      sha256 "ad7981870f7f0face17cf03ab70077cf7d165951804effb7fd39042571f7f730"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
