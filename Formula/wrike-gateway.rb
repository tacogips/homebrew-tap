class WrikeGateway < Formula
  desc "Capability-scoped Wrike API v4 CLI with a project-owned GraphQL contract"
  homepage "https://github.com/tacogips/wrike-gateway"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.1/wrike-gateway-0.2.1-darwin-arm64.tar.gz"
      sha256 "42f547f07d1584925fa756018ecb05c033a41849e6b20bb950d1e98dc498bb87"
    else
      url "https://github.com/tacogips/wrike-gateway/releases/download/v0.2.1/wrike-gateway-0.2.1-darwin-x64.tar.gz"
      sha256 "1a5b2867ac83c237301a2ca8ce5b9ccb11b51b3fbab3356cae53fe0f4a190ba8"
    end
  end

  def install
    bin.install "bin/wrike-gateway-reader"
    bin.install "bin/wrike-gateway-writer"
    bin.install "bin/wrike-gateway-admin"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/wrike-gateway-reader --version")
  end
end
