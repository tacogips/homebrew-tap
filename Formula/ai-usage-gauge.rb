class AiUsageGauge < Formula
  desc "Dashboard and CLI for Claude Code, Codex, and Antigravity subscription limits and usage costs"
  homepage "https://github.com/tacogips/ai-usage-gauge"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ai-usage-gauge/releases/download/v0.6.0/ai-usage-gauge-0.6.0-darwin-arm64.tar.gz"
      sha256 "f7bd39495e7f15db89be41ff7d961fbb34076ac0728b58f732675f57be19fce5"
    else
      url "https://github.com/tacogips/ai-usage-gauge/releases/download/v0.6.0/ai-usage-gauge-0.6.0-darwin-x64.tar.gz"
      sha256 "2e59e343115677a49e5b9fff0a4255ca39a78e66cc2cb99c11e8bc2651d9fced"
    end
  end

  def install
    bin.install "bin/ai-usage-gauge"
    bin.install "bin/ai-usage-gauge-app"
    share.install "share/ai-usage-gauge"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/ai-usage-gauge --version")
  end
end
