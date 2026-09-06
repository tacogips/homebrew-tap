class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.12"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-sender-0.1.12-darwin-arm64.tar.gz"
      sha256 "fd1e0f8e567337d494c70fe4a67cdc85b1c853dff0dfc9aca5baa823a5f3d2db"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-sender-0.1.12-darwin-x64.tar.gz"
      sha256 "5f1fd90147e77b8eaa60de07b6f75a223deb6b05497c13445b114e6cb880b239"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
