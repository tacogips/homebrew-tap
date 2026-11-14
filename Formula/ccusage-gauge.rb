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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.3/ccusage-gauge-0.4.3-darwin-arm64.tar.gz"
      sha256 "1521cef2bff809082682b569a66e1408c1493d3b86ce76c45ba203254e709de3"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.3/ccusage-gauge-0.4.3-darwin-x64.tar.gz"
      sha256 "f3ea91d0b66511f02dab6cc3c5cce6d606c66a9a3e6d3a3d85ef4cbe56edd3ab"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.4.3", shell_output("#{bin}/ccusage-gauge --version")
  end
end
