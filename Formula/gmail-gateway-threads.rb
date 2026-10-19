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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-threads-0.1.24-darwin-arm64.tar.gz"
      sha256 "216ca8e6985005cec20e40ed0402c4413eb529f653167a1403d5ee4ac3088500"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.24/gmail-gateway-threads-0.1.24-darwin-x64.tar.gz"
      sha256 "22550c3e271b3259758c2f68d8926370f3c57aa6eef06d20e171c62d0bc3307f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
