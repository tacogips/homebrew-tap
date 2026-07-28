class CcusageGauge < Formula
  desc "Monitor AI coding-agent usage and costs"
  homepage "https://github.com/tacogips/ccusage-gauge"
  version "0.1.21"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.21/ccusage-gauge-0.1.21-darwin-arm64.tar.gz"
      sha256 "b3e48cb5a7ed504d45c5a20aea4f9813aa3af16a11554e22e24d56d4482b0b0b"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.21/ccusage-gauge-0.1.21-darwin-x64.tar.gz"
      sha256 "d2d50a4cc072339d181ffd76e5e379dd08a06f36e297020c33f505a27a6b524b"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.1.21", shell_output("#{bin}/ccusage-gauge --version")
  end
end
