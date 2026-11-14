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
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.17/kaiba-0.1.17-darwin-arm64.tar.gz"
      sha256 "533c3fe7c5958e29070bfa657cc235cd5b56409a626eccb843fc07cf469e4399"
    else
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.17/kaiba-0.1.17-darwin-x64.tar.gz"
      sha256 "167bff92f921fc60623bafc158034b9623751017588eb45f42980eaec438e708"
    end
  end

  def install
    bin.install "bin/kaiba"
  end

  test do
    assert_match "0.1.17", shell_output("#{bin}/kaiba --version")
  end
end
