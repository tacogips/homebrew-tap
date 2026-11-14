class RunwaymlCli < Formula
  desc "Runway CLI with browser OAuth, MCP tools, and developer API support"
  homepage "https://github.com/tacogips/runwayml-cli"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/homebrew-tap/releases/download/runwayml-cli-v0.1.0/runwayml-cli-0.1.0-darwin-arm64.tar.gz"
      sha256 "7aadc68b8ce46d41ef427e489a62d1b02e4baee46586b71ed98f7eee022c1fc6"
    else
      url "https://github.com/tacogips/homebrew-tap/releases/download/runwayml-cli-v0.1.0/runwayml-cli-0.1.0-darwin-x64.tar.gz"
      sha256 "02c53a92d79e945152ef9382d824cbf26e38b21d30b75a599c9c1a1096c4a536"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/homebrew-tap/releases/download/runwayml-cli-v0.1.0/runwayml-cli-0.1.0-linux-arm64.tar.gz"
      sha256 "4316ed898b8aa0a91c52e9a0f28e0e739bc16c932055e697a45c73efc46243df"
    else
      url "https://github.com/tacogips/homebrew-tap/releases/download/runwayml-cli-v0.1.0/runwayml-cli-0.1.0-linux-x64.tar.gz"
      sha256 "5f409b1cbec035b8e6bef9258516ae94552dcfc7704ea0faa2180df18526188a"
    end
  end

  def install
    bin.install "bin/runwayml-cli"
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/runwayml-cli version").strip
  end
end
