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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.20/ccusage-gauge-0.1.20-darwin-arm64.tar.gz"
      sha256 "adf97a93832d8dee018cd7cd55e37ac0b1437d2d9492f9b843b6e8b5f3a34ff2"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.20/ccusage-gauge-0.1.20-darwin-x64.tar.gz"
      sha256 "f1b2cd2246eca9bb2cb95552631c39b0fc7ce7787a66a013da426767ed539b05"
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
