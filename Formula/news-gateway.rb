class App < Formula
  desc "A Swift command line tool"
  homepage "https://github.com/tacogips/news-gateway"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/news-gateway/releases/download/v0.1.0/news-gateway-0.1.0-darwin-arm64.tar.gz"
      sha256 "b05b660be4cebdd450d1f09e6e8f2b5c5aace3b744e6156b227fe6ceefecebcc"
    else
      url "https://github.com/tacogips/news-gateway/releases/download/v0.1.0/news-gateway-0.1.0-darwin-x64.tar.gz"
      sha256 "4eea4206486b18e9920aab31c5ffa0dd571f9b550ad0e726015e31926f4679b0"
    end
  end

  def install
    bin.install "bin/news-gateway"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/news-gateway --version")
  end
end
