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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.22/ccusage-gauge-0.1.22-darwin-arm64.tar.gz"
      sha256 "3110e4e7dd6fa3d342b3e973387523b3da583f1c76518c591042effdb573ea4c"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.22/ccusage-gauge-0.1.22-darwin-x64.tar.gz"
      sha256 "7268ed300eac305c53dc978d29d98e10b33448b0e08164d7dda942a8a1ab723e"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.1.22", shell_output("#{bin}/ccusage-gauge --version")
  end
end
