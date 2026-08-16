class ResendGateway < Formula
  desc "Swift SDK and capability-scoped command line tools for the Resend API"
  homepage "https://github.com/tacogips/resend-gateway"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/resend-gateway/releases/download/v0.1.0/resend-gateway-0.1.0-darwin-arm64.tar.gz"
      sha256 "814f7e4cdf325f49e4481b325c4a4e2a09cccb0a3365c4932568fca2f31b38fc"
    else
      url "https://github.com/tacogips/resend-gateway/releases/download/v0.1.0/resend-gateway-0.1.0-darwin-x64.tar.gz"
      sha256 "de80b7f77316aca5fec5b578bef74956efd14974335015a8149158372307d6e0"
    end
  end

  def install
    bin.install "bin/resend-gateway-reader"
    bin.install "bin/resend-gateway-writer"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/resend-gateway-reader --version")
    assert_match "0.1.0", shell_output("#{bin}/resend-gateway-writer --version")
  end
end
