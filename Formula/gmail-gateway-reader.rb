class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.10"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-reader-0.1.10-darwin-arm64.tar.gz"
      sha256 "7842ce35f5d8f120dd8e886786f910b431668dc567537421f1a7d25ff583afac"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-reader-0.1.10-darwin-x64.tar.gz"
      sha256 "a611d1c902e676de326efc3dd4254d19a0580e3785a629da29b604ef4a6f3688"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
