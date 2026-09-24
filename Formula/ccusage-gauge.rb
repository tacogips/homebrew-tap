class CcusageGauge < Formula
  desc "Native dashboard and CLI for AI coding-agent usage costs"
  homepage "https://github.com/tacogips/ccusage-gauge"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.2.2/ccusage-gauge-0.2.2-darwin-arm64.tar.gz"
      sha256 "55910194f9f0d9ab66a25cc3b3ff9c72cf34caa70b49b1e03701575d33b27101"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.2.2/ccusage-gauge-0.2.2-darwin-x64.tar.gz"
      sha256 "fa51ad6782c995a2c0b0abfef8cf763ef1c45f1b2e8ac45bcd523ed6e62a3fd8"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/ccusage-gauge --version")
  end
end
