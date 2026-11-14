class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-draft-0.1.26-darwin-arm64.tar.gz"
      sha256 "db9a5ed360c7bb7217f6a4e847f58b55bbb57a4280138662a26c72d9280ddf75"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.26/gmail-gateway-draft-0.1.26-darwin-x64.tar.gz"
      sha256 "257f6a9b1846adcc91e96b74497772dda73a0b135ff93545aa9834c42453f21c"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
