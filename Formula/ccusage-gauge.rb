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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.0/ccusage-gauge-0.4.0-darwin-arm64.tar.gz"
      sha256 "868e6f69254078d2d1ab3caa84c42e78385c95cd04d5c640312c7526667676aa"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.0/ccusage-gauge-0.4.0-darwin-x64.tar.gz"
      sha256 "6f587649b01b06a637cdd3b1b947db6fe507b8e4bbf5e69123c0ca88ab3db2b8"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    bin.install "bin/ccusage-gauge-dashboard"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/ccusage-gauge --version")
  end
end
