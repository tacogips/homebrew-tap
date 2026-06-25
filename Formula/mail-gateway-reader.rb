class MailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.3/mail-gateway-reader-0.1.3-darwin-arm64.tar.gz"
      sha256 "ac3e709c617b06b628f9bcd188e97ea112bfa44dfc3fba3ddcc23b4ece162fca"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.3/mail-gateway-reader-0.1.3-darwin-x64.tar.gz"
      sha256 "d8229737677c3004aee09dff48f92eca7845a5d40409daa6dd4cc6d91b4b20c1"
    end
  end

  def install
    bin.install "bin/mail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-reader --help")
  end
end
