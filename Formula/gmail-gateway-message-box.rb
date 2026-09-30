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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-message-box-0.1.15-darwin-arm64.tar.gz"
      sha256 "30e13a9d1cb38a04506203f77d8aa25145b2c8c6af86d0c6eb9c95e804a5ae30"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-message-box-0.1.15-darwin-x64.tar.gz"
      sha256 "eff5025992d02259a54eb45e5e47236cfcd6f65269f02ee00aef9be0dda4cd5a"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
