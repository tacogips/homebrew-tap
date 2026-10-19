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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-message-box-0.1.23-darwin-arm64.tar.gz"
      sha256 "90f8b2d1a8fbbc4cdf2169562b49e2d6f90bdcf0b59fc896ea5a41081a276258"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-message-box-0.1.23-darwin-x64.tar.gz"
      sha256 "a6f6b5d671ba256373ee3e3497289660d57b2e3594a06d0d6078ff224dc15334"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
