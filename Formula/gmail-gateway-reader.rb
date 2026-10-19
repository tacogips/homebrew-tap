class GmailGatewayReader < Formula
  desc "Read-only Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-reader-0.1.25-darwin-arm64.tar.gz"
      sha256 "48d837a130cac95f71d41b817c396f1bd6ea5cf158f153d1f26f74749c17504b"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.25/gmail-gateway-reader-0.1.25-darwin-x64.tar.gz"
      sha256 "c6694c241b8280e6b9fb982c4898ae4f0fd69630e14472e549f4b429678c8df0"
    end
  end

  def install
    bin.install "bin/gmail-gateway-reader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-reader --help")
  end
end
