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
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.5/kaiba-0.1.5-darwin-arm64.tar.gz"
      sha256 "06d926a354da5d37e6eaf6b4d605565fcb80be5f2e575f7b942a6d6c8836c8d6"
    else
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.5/kaiba-0.1.5-darwin-x64.tar.gz"
      sha256 "b7d66cb820babec68e40bea8cdd2ebce3631aab582fea1ba89262977fcb4cbaa"
    end
  end

  def install
    bin.install "bin/kaiba"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/kaiba --version")
  end
end
