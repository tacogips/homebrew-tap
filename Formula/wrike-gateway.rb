class WrikeGateway < Formula
  desc "Capability-scoped Wrike API v4 CLI with a project-owned GraphQL contract"
  homepage "https://github.com/tacogips/wrike-gateway"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.0/wrike-gateway-0.2.0-darwin-arm64.tar.gz"
      sha256 "6ee6b84945234b1447c0665e3d85c536f669d4ba24f1aac510658ef16837e33b"
    else
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.0/wrike-gateway-0.2.0-darwin-x64.tar.gz"
      sha256 "2ac8140e5e13f7fd52ce66328f80fc5fdb8f43886d45704c8003d02b47b8120c"
    end
  end

  def install
    bin.install "bin/wrike-gateway-reader"
    bin.install "bin/wrike-gateway-writer"
    bin.install "bin/wrike-gateway-admin"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/wrike-gateway-reader --version")
  end
end
