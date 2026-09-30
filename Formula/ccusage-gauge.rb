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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.3.0/ccusage-gauge-0.3.0-darwin-arm64.tar.gz"
      sha256 "431ff41fc49b87731911244e6ed8034de0a80c0e4aa0e29d7d9247949b4d092b"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.3.0/ccusage-gauge-0.3.0-darwin-x64.tar.gz"
      sha256 "9f87c24d9f6c28c89a73f44506995b7fb96fbae40d4716688e6a1164917b7785"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/ccusage-gauge --version")
  end
end
