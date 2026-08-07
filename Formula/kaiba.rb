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
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.2/kaiba-0.1.2-darwin-arm64.tar.gz"
      sha256 "600cf4488924df201fd4a83a8016c5ea0679173c0a750a1da13ee54a66e8e70f"
    else
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.2/kaiba-0.1.2-darwin-x64.tar.gz"
      sha256 "707f1fcd8321768d0f5c05637763ada8b17b19bc24ce37450dbc05f10d712282"
    end
  end

  def install
    bin.install "bin/kaiba"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/kaiba --version")
  end
end
