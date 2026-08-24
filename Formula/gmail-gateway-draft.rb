class GmailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  version "0.1.8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.8/gmail-gateway-draft-0.1.8-darwin-arm64.tar.gz"
      sha256 "852b19b39971bfc66c98ad53887c48d1f6344ee568d533c919f4d2f432492ef9"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.8/gmail-gateway-draft-0.1.8-darwin-x64.tar.gz"
      sha256 "4f6f7f58c9e69cd09243b7f1fac2278d8a846f4a9cf4888643eb6d3a04bba58b"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
