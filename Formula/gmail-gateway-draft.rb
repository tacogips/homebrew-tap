class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.10"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-draft-0.1.10-darwin-arm64.tar.gz"
      sha256 "d33576bfaa45c5aac4c90c4dbebe4168362003eabfa4b175edb14ca20bb38bab"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.10/gmail-gateway-draft-0.1.10-darwin-x64.tar.gz"
      sha256 "b7b1f4048efc2962bff4d5a843df184e3a8ad51bb21208865e2b5269f7544b30"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
