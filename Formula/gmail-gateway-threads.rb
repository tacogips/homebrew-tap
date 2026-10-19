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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-threads-0.1.25-darwin-arm64.tar.gz"
      sha256 "3c52d1b6bab39b086e59afc34732fb6398e485810ad121f4a5512d1cabd8b663"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-threads-0.1.25-darwin-x64.tar.gz"
      sha256 "76d04c815499d8dcff144840c65dea6fc00d980e1af3c4c92c95a9c5e92da688"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
