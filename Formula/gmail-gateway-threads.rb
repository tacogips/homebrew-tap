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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-threads-0.1.22-darwin-arm64.tar.gz"
      sha256 "e2909c0be6cc2ce589928b1a4c68edc053fd4f82610e02470e5d220dc6fe115a"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-threads-0.1.22-darwin-x64.tar.gz"
      sha256 "f39039e612076e088d5f8f1ec8c006c6edc075089eadb242c4346a086bb3fd5a"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
