class GmailGatewaySender < Formula
  desc "Direct-send Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.7/gmail-gateway-sender-0.1.7-darwin-arm64.tar.gz"
      sha256 "5b744299dec37d35584d4deeee6261145054304041e033c804022081a4eb574b"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.7/gmail-gateway-sender-0.1.7-darwin-x64.tar.gz"
      sha256 "237aa1c288ccf9f0186c62665cb5f42a2737aad94a1c25f6c716d9903c4e7330"
    end
  end

  def install
    bin.install "bin/gmail-gateway-sender"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-sender --help")
  end
end
