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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.1/ccusage-gauge-0.4.1-darwin-arm64.tar.gz"
      sha256 "3eaa2ff51602b60788771a4c8a42894414cb305845bedbe144c7bfd4c5aa197d"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.1/ccusage-gauge-0.4.1-darwin-x64.tar.gz"
      sha256 "2f58cb5812e359560d1f8f5611ee629b78be69ecfba405032519da92f0c3aca1"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/ccusage-gauge --version")
  end
end
