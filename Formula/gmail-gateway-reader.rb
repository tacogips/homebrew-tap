class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.7/gmail-gateway-reader-0.1.7-darwin-arm64.tar.gz"
      sha256 "6667beee917d15a687752f157351e618cfac12defda2e114a0cccde52c497191"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.7/gmail-gateway-reader-0.1.7-darwin-x64.tar.gz"
      sha256 "c2f683399bee994c572ee04901fa7038945ca13d49c38ce4068f94668d154fee"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
