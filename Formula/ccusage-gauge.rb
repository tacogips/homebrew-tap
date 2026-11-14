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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.3.1/ccusage-gauge-0.3.1-darwin-arm64.tar.gz"
      sha256 "c37fafee984255000d7a0c06037745d177bd83ed1a292e73f5358a99a6c0974d"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.3.1/ccusage-gauge-0.3.1-darwin-x64.tar.gz"
      sha256 "2f9fdaca54c8fbb019ebe6a167dc35e68daf962c29b678e97be71bbfd440da3d"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/ccusage-gauge --version")
  end
end
