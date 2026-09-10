class WrikeGateway < Formula
  desc "Capability-scoped Wrike API v4 CLI with a project-owned GraphQL contract"
  homepage "https://github.com/tacogips/wrike-gateway"
  version "0.2.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.5/wrike-gateway-0.2.5-darwin-arm64.tar.gz"
      sha256 "af838b3eab32de4ee5dc374d07c697b3ea9fa188f6209fec4ccacda3f6e1d735"
    else
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.5/wrike-gateway-0.2.5-darwin-x64.tar.gz"
      sha256 "333ea93e3ce744a851faf7936cb720cee3116aaf9d9c602aedc287c23c530421"
    end
  end

  def install
    bin.install "bin/wrike-gateway-reader"
    bin.install "bin/wrike-gateway-writer"
    bin.install "bin/wrike-gateway-admin"
  end

  test do
    assert_match "0.2.5", shell_output("#{bin}/wrike-gateway-reader --version")
  end
end
