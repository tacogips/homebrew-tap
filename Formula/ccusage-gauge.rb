class CcusageGauge < Formula
  desc "Monitor AI coding-agent usage and costs"
  homepage "https://github.com/tacogips/ccusage-gauge"
  version "0.1.20"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.20/ccusage-gauge-0.1.20-darwin-arm64.tar.gz?revision=2"
      sha256 "1f86f2ee534392a9b7454e27807afd584d387d0cbcb83462321fc8cf367ddea9"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.20/ccusage-gauge-0.1.20-darwin-x64.tar.gz?revision=2"
      sha256 "f668cb4d75d7c83314b43be74da44153122c1781f279faec5443b34a65228fdb"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.1.20", shell_output("#{bin}/ccusage-gauge --version")
  end
end
