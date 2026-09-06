class GmailGatewayThreads < Formula
  desc "Mailbox-mutating Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-threads-0.1.11-darwin-arm64.tar.gz"
      sha256 "5612aafb046d24ea639a7c723e3f6c4be2aa1225c098048d0216d5d8ac063f54"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-threads-0.1.11-darwin-x64.tar.gz"
      sha256 "f8f7d0cabd6818b6cc74542fdd59a6c2502e7e4d8fa22b0d657fc224f2c4c465"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
