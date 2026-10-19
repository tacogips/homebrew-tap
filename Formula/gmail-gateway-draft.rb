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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-draft-0.1.23-darwin-arm64.tar.gz"
      sha256 "1024f6567a89aa5ba579c9eb3df557b301dd30feb621a3d7eeac050f61734a39"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.23/gmail-gateway-draft-0.1.23-darwin-x64.tar.gz"
      sha256 "f8835862d62cc1edd79af9a20b157709030c95012d18edcf8708c1c2af69b830"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
