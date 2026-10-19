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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-message-box-0.1.25-darwin-arm64.tar.gz"
      sha256 "2693c17b49db16203056b7afe497928b15c098532f77158cb9363db8eee216e4"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-message-box-0.1.25-darwin-x64.tar.gz"
      sha256 "096f41411926374eb6b48b7fa306bd230543c6f0f5672f761257aae5943b1f90"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
