class CcusageGauge < Formula
  desc "Monitor AI coding-agent usage and costs"
  homepage "https://github.com/tacogips/ccusage-gauge"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.26/ccusage-gauge-0.1.26-darwin-arm64.tar.gz"
      sha256 "09798273c4368e0b53daa2e69b5ac58666b382f173922c95a0e38c2ca76b0fa1"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.26/ccusage-gauge-0.1.26-darwin-x64.tar.gz"
      sha256 "f4ec9f8616195b1efb0baab4b2a95903af80aa7819f865f899fbf8fcceb66519"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.1.26", shell_output("#{bin}/ccusage-gauge --version")
  end
end
