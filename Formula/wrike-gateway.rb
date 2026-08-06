class WrikeGateway < Formula
  desc "Capability-scoped Wrike API v4 CLI with a project-owned GraphQL contract"
  homepage "https://github.com/tacogips/wrike-gateway"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.1.0/wrike-gateway-0.1.0-darwin-arm64.tar.gz"
      sha256 "8d687ef33400d1102aeb041b9b1fc642f4dad9187d86edab598130c8709193e8"
    else
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.1.0/wrike-gateway-0.1.0-darwin-x64.tar.gz"
      sha256 "27568e0a616e8bbcb22b1f70d81d569b1a7a31a78521d84cef890ab34c914284"
    end
  end

  def install
    bin.install "bin/wrike-gateway-reader"
    bin.install "bin/wrike-gateway-writer"
    bin.install "bin/wrike-gateway-admin"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/wrike-gateway-reader --version")
  end
end
