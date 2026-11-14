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
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.23/ccusage-gauge-0.1.23-darwin-arm64.tar.gz"
      sha256 "5f658ea89ee82d89525a5b64eba57326235c6b65fe6be24db8339f7e70ad7e9c"
    else
      url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.1.23/ccusage-gauge-0.1.23-darwin-x64.tar.gz"
      sha256 "21b4ead810a0a9b381de292cf69396983ed0b94939b184109b676e61c6e03535"
    end
  end

  def install
    bin.install "bin/ccusage-gauge"
    share.install "share/ccusage-gauge"
  end

  test do
    assert_match "0.1.23", shell_output("#{bin}/ccusage-gauge --version")
  end
end
