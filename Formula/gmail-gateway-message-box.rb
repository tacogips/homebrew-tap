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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-message-box-0.1.18-darwin-arm64.tar.gz"
      sha256 "8aa28497d6dfdaa33dfd640208ea316865fe11edaf498b8ec73fcd025c136d51"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.18/gmail-gateway-message-box-0.1.18-darwin-x64.tar.gz"
      sha256 "eddc8be1f492a5d49f7e1f23a92e330bab776e870bf19eec0696988238d3ec83"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
