class CcusageGauge < Formula
  desc "Dashboard and CLI for Claude Code and Codex subscription limits and usage costs"
  homepage "https://github.com/tacogips/ccusage-gauge"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.5.0/ccusage-gauge-0.5.0-darwin-arm64.tar.gz"
      sha256 "8998787e5a646710be463d3db4ab9d27527b0adb5244cce0816a2a5ff71ff82e"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.5.0/ccusage-gauge-0.5.0-darwin-x64.tar.gz"
      sha256 "1f435b4a3c5f7e1b7d14dbfe2b52e26a3aeb693b7f891a4af6df7e42bb85bd35"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/ccusage-gauge --version")
  end
end
