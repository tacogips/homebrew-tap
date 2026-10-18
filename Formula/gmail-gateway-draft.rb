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
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-draft-0.1.22-darwin-arm64.tar.gz"
      sha256 "1976d3adc5b199dd54b3bc02b63bf4b93fc8a04408bbecb1e144dc65b7b9e676"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.22/gmail-gateway-draft-0.1.22-darwin-x64.tar.gz"
      sha256 "6da036abd075f63c518915f5329975de9c21bfc78d83dbc858700b1e7296fd4d"
    end
  end

  def install
    bin.install "bin/gmail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-draft --help")
  end
end
