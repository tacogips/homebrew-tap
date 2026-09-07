class Kaiba < Formula
  desc "System-memory service for AI agents"
  homepage "https://github.com/tacogips/kaiba"
  version "0.1.15"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.15/kaiba-0.1.15-darwin-arm64.tar.gz"
      sha256 "75c431f175df85e45eac79d21452f8bab55d6d24ea8e3ca17af22f72a8070150"
    else
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.15/kaiba-0.1.15-darwin-x64.tar.gz"
      sha256 "3b07533c4c8d9f20519019c7beed1ac970abc64a3e4687baa579a522179f3373"
    end
  end

  def install
    bin.install "bin/kaiba"
  end

  test do
    assert_match "0.1.15", shell_output("#{bin}/kaiba --version")
  end
end
