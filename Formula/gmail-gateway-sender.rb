class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-sender-0.1.15-darwin-arm64.tar.gz"
      sha256 "30a959d131fc8506a94e0098083e34a803991cf89f6d085804f832a671180c51"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.15/gmail-gateway-sender-0.1.15-darwin-x64.tar.gz"
      sha256 "62bf599b5ebdaeb2ed708b337370b3b9a75b89f0ec2f99a2c6ee701fa8c43e52"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
