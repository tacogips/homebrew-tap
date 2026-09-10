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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-threads-0.1.13-darwin-arm64.tar.gz"
      sha256 "5c006bc7808d207edf17cf6c46bd8150936fe5fbbceda6cfa7cdd5f9c4e19811"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-threads-0.1.13-darwin-x64.tar.gz"
      sha256 "7e14892503ae60035d8a080be261526fe2595121da4d322deaba9f2fe03a1787"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
