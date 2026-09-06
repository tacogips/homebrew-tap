class GmailGatewayMessageBox < Formula
  desc "Mail-ingesting Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-message-box-0.1.11-darwin-arm64.tar.gz"
      sha256 "437478e883a0715ed115b746e706f619413994eba45d9f3a80bc923078692f88"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.11/gmail-gateway-message-box-0.1.11-darwin-x64.tar.gz"
      sha256 "9360fe617fd48c68ddfcf33b55250690acf5a109ca1c9550383ea693d69bbac0"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
