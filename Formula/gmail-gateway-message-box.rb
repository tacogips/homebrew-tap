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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-message-box-0.1.29-darwin-arm64.tar.gz"
      sha256 "5bf586de848df94587f746030873f14be2ab4a84e09f5f552a620fce4f88c731"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.29/gmail-gateway-message-box-0.1.29-darwin-x64.tar.gz"
      sha256 "9c3861e10da6ce22c38e3b5562635fd6cc9626f9fe03f7ca676cf2244f1964b6"
    end
  end

  def install
    bin.install "bin/gmail-gateway-message-box"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-message-box --help")
  end
end
