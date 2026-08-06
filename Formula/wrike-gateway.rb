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
      sha256 "c5b3c94d0ea24b578ff7e5c8145aaffdadafd72905c46c0514b9a7b39cac0cbd"
    else
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.0/wrike-gateway-0.2.0-darwin-x64.tar.gz"
      sha256 "a4c078186505e6fe2f68d8141dd73a704c869bd0c5fabb5add40f32c9d3c0f87"
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
