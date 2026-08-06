class WrikeGateway < Formula
  desc "Capability-scoped Wrike API v4 CLI with a project-owned GraphQL contract"
  homepage "https://github.com/tacogips/wrike-gateway"
  version "0.2.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.2/wrike-gateway-0.2.2-darwin-arm64.tar.gz"
      sha256 "28de5b136463514aa77c55fdfd44378eb6b626caae92697c9cbc3e7860b53a3b"
    else
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.2/wrike-gateway-0.2.2-darwin-x64.tar.gz"
      sha256 "05fb86d2f71853b6d7d3b3b3a9332ea9c288628f98af38f7c4f130ec2f6cae37"
    end
  end

  def install
    bin.install "bin/wrike-gateway-reader"
    bin.install "bin/wrike-gateway-writer"
    bin.install "bin/wrike-gateway-admin"
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/wrike-gateway-reader --version")
  end
end
