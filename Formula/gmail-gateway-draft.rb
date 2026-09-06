class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.12"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-draft-0.1.12-darwin-arm64.tar.gz"
      sha256 "a7b577e9a1b9ec8823b2fcc0370a2c7d5224adc2b8e8b6f4f1d2266e81725edc"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.12/gmail-gateway-draft-0.1.12-darwin-x64.tar.gz"
      sha256 "d14d639049ccfb1a5f37d3690b0a910034cc76f0f13c9bc54f6cdc0718e60a56"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
