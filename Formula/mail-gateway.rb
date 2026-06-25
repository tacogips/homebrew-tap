class MailGateway < Formula
  desc "Swift command-line gateway for Gmail workflows"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.1/mail-gateway-0.1.1-darwin-arm64.tar.gz"
      sha256 "e57d70130a0c51afc1acb54a71b0796017824969dd7d1d0e39aea93cc9e995e3"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.1/mail-gateway-0.1.1-darwin-x64.tar.gz"
      sha256 "1f7d0f8325a39f6e19fd2bbcc826ec487e4ea950d68362c1bca32b0b8f1626fd"
    end
  end

  def install
    bin.install "bin/mail-gateway"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/mail-gateway --version")
  end
end
