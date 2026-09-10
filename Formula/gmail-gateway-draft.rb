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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-draft-0.1.13-darwin-arm64.tar.gz"
      sha256 "388b59a314a39659cbef7948f48e5e968ae3fc8141756305f1920304d0f1622a"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.13/gmail-gateway-draft-0.1.13-darwin-x64.tar.gz"
      sha256 "98446bacf75ba44dd5dc3626612814a5da19150b722bc63c7c5e0a08f0fc3a12"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
