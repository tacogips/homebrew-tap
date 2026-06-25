class MailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.2/mail-gateway-draft-0.1.2-darwin-arm64.tar.gz"
      sha256 "75caff94d1231ba133b273095f50fca42023559e58e77b9d3a0b9fa4323999cb"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.2/mail-gateway-draft-0.1.2-darwin-x64.tar.gz"
      sha256 "1721b33aceba02115b43950bfd20600d59246240c2ef76a5efe96bdd30ebd344"
    end
  end

  def install
    bin.install "bin/mail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-draft --help")
  end
end
