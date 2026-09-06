class WrikeGateway < Formula
  desc "Capability-scoped Wrike API v4 CLI with a project-owned GraphQL contract"
  homepage "https://github.com/tacogips/wrike-gateway"
  version "0.2.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.4/wrike-gateway-0.2.4-darwin-arm64.tar.gz"
      sha256 "d0617b71242a89a547c07800c56011ce3e56ddfd743c1a488ecece52a48eec5b"
    else
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.4/wrike-gateway-0.2.4-darwin-x64.tar.gz"
      sha256 "d51442626b206f3eaaf6011a2c9c7b7fb9d8071700801bec6e272ce98d8d9bd4"
    end
  end

  def install
    bin.install "bin/wrike-gateway-reader"
    bin.install "bin/wrike-gateway-writer"
    bin.install "bin/wrike-gateway-admin"
  end

  test do
    assert_match "0.2.4", shell_output("#{bin}/wrike-gateway-reader --version")
  end
end
