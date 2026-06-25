class MailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.3/mail-gateway-draft-0.1.3-darwin-arm64.tar.gz"
      sha256 "982fdad53c612072e39cd0b062f2e0d499227e2ab87e2db0ff9cbca27aa48a10"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.3/mail-gateway-draft-0.1.3-darwin-x64.tar.gz"
      sha256 "e4d6dabda4bb03170733b1653a587c2738c36fe9fcc30852a6a89e9339c662b7"
    end
  end

  def install
    bin.install "bin/mail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-draft --help")
  end
end
