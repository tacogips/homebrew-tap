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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-threads-0.1.14-darwin-arm64.tar.gz"
      sha256 "c1bf2a521c8c3c3dabc9e6f0f95fa02e69e5cdb190188cc452cfb7dc91922ef4"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.14/gmail-gateway-threads-0.1.14-darwin-x64.tar.gz"
      sha256 "2b17e51b7ef0d603c3175867c4a9b6750cbe222e4561c96c74e72453f0c44250"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
