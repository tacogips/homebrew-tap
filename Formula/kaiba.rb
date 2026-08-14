class Kaiba < Formula
  desc "System-memory service for AI agents"
  homepage "https://github.com/tacogips/kaiba"
  version "0.1.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.6/kaiba-0.1.6-darwin-arm64.tar.gz"
      sha256 "aa294716c2093bc96a961c22c6600430c362d10719ef20c67eebfe6ee604b4c4"
    else
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.6/kaiba-0.1.6-darwin-x64.tar.gz"
      sha256 "22aa340952773d7c1315c4347d8f09ad59dcd8669ac24841db3875b0c45598c6"
    end
  end

  def install
    bin.install "bin/kaiba"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/kaiba --version")
  end
end
