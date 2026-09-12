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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.2.1/ccusage-gauge-0.2.1-darwin-arm64.tar.gz"
      sha256 "db656710a3a3d2c4f24866af00f63716cc35b2d1cfa4f5e2cc69850bd0ba1f65"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.2.1/ccusage-gauge-0.2.1-darwin-x64.tar.gz"
      sha256 "2dc9cef21b1b071edc92c1272e5294d97401ff5e0a9756fe7e04a8b519e0c2d9"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/ccusage-gauge --version")
  end
end
