class Kaiba < Formula
  desc "System-memory service for AI agents"
  homepage "https://github.com/tacogips/kaiba"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.3/kaiba-0.1.3-darwin-arm64.tar.gz"
      sha256 "0ee30711b4966643ca2205d5f430eb63bd99c74e8179db381752b922c8a91def"
    else
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.3/kaiba-0.1.3-darwin-x64.tar.gz"
      sha256 "4bb19e6f368b0679be48c46306595b2f9d98b17f1e354e8f91ccade346227a0a"
    end
  end

  def install
    bin.install "bin/kaiba"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/kaiba --version")
  end
end
