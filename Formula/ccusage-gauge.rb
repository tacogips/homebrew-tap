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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.2/ccusage-gauge-0.4.2-darwin-arm64.tar.gz"
      sha256 "d43b53fbca50f58880fe472a642d42784897a17167ba4d02e2adede49dfddcb6"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.2/ccusage-gauge-0.4.2-darwin-x64.tar.gz"
      sha256 "0ac672ebd64afdf374221657d0aba3e9fb936f9c13a3a793b5dba6ad08cd93c4"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.4.2", shell_output("#{bin}/ccusage-gauge --version")
  end
end
