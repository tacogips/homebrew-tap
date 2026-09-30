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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-threads-0.1.16-darwin-arm64.tar.gz"
      sha256 "1e36615e4de1060be64de7b81435a57adbdf49d1b4c84f441d6d9d51ae0fb402"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.16/gmail-gateway-threads-0.1.16-darwin-x64.tar.gz"
      sha256 "b11177270b68268e80dd577fd468f81d2d3844bac619280c155b7bcdb072e2bb"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
