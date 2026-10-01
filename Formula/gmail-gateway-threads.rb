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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-threads-0.1.17-darwin-arm64.tar.gz"
      sha256 "bd9a27d4ea75f214974377e4e1563a5419478c7d880b72e511c2094f2fa02114"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.17/gmail-gateway-threads-0.1.17-darwin-x64.tar.gz"
      sha256 "e1d3bfc3cf09bd54f1ac24839b79038d8df2811dd7d34b21df82283711066e63"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
