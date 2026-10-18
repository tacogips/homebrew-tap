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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-sender-0.1.22-darwin-arm64.tar.gz"
      sha256 "4ddd288a831bc8f24714232112937591dce8e296c61608ece67e3af2c6b34ec0"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-sender-0.1.22-darwin-x64.tar.gz"
      sha256 "fdb085654f5e28047eb2af781cdd33562358e1ae7185128abe0d97329101e35f"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
