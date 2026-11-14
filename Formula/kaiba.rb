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
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.19/kaiba-0.1.19-darwin-arm64.tar.gz"
      sha256 "f3ce15152a910a61450366ffa8409411ba5d60c03603af2d9120d93fa4e006c3"
    else
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.19/kaiba-0.1.19-darwin-x64.tar.gz"
      sha256 "14424fe729a9a3c43b40cecfb9cc1a56733300974bb666bf74107b193de0867f"
    end
  end

  def install
    bin.install "bin/kaiba"
  end

  test do
    assert_match "0.1.19", shell_output("#{bin}/kaiba --version")
  end
end
