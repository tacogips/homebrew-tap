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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.2.0/ccusage-gauge-0.2.0-darwin-arm64.tar.gz"
      sha256 "d9aac657ae254fbed28ae0a6856b3af0667fe3a53ea1248859a276023aeb2004"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.2.0/ccusage-gauge-0.2.0-darwin-x64.tar.gz"
      sha256 "775dbc4aa4ab34fbc81367f50ace00a517df060fc665de0d7c0733d97a6ffc37"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/ccusage-gauge --version")
  end
end
