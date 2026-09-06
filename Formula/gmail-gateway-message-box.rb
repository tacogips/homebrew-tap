class GmailGatewayMessageBox < Formula
  desc "Mail-ingesting Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-message-box-0.1.12-darwin-arm64.tar.gz"
      sha256 "d4f087d27ffae9740110b59592deef10d67efb7c5ae1ed40c20f411cd6347936"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-message-box-0.1.12-darwin-x64.tar.gz"
      sha256 "fd30ef0cc2ccf350206a96c6f51e1d18c0724cd09aaab267c67b5bc9744103aa"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
