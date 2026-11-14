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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.25/ccusage-gauge-0.1.25-darwin-arm64.tar.gz"
      sha256 "27948706413f58b8d8619008a85fbf1f98999cc37b6f067d22e5bfb5ca2d3d5c"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.25/ccusage-gauge-0.1.25-darwin-x64.tar.gz"
      sha256 "f6a70130fea0485983870db80e7b7817d2150d9574544bbd8d22709988d00f46"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.1.25", shell_output("#{bin}/ccusage-gauge --version")
  end
end
