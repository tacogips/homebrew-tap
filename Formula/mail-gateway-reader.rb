class MailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.5/mail-gateway-reader-0.1.5-darwin-arm64.tar.gz"
      sha256 "11247ca8c694c6c723065070d9d38db2fca6e5bf2fcc01c74291a53b3e69df26"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.5/mail-gateway-reader-0.1.5-darwin-x64.tar.gz"
      sha256 "87a2c0f0f0075c4be36a80b3a247cce8907dd3b661ac02c73216beef2f913bd0"
    end
  end

  def install
    bin.install "bin/mail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-reader --help")
  end
end
