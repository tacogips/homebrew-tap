class GmailGatewayThreads < Formula
  desc "Mailbox-mutating Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.10"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-threads-0.1.10-darwin-arm64.tar.gz"
      sha256 "d0d66c7c0a6da82ec40014bb7c19dbea11a29131dfecc3220a11efb5383983c3"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-threads-0.1.10-darwin-x64.tar.gz"
      sha256 "be99c4e4e9886226a129569c7e9fbb73a9ac5c55419519f74f9bfd22d3cd81b3"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
