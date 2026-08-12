class AnydocSwift < Formula
  desc "Convert PDF, Word, Excel, PowerPoint, OpenDocument, RTF, EPUB, CSV to Markdown"
  homepage "https://github.com/tacogips/anydoc-swift"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/anydoc-swift/releases/download/v0.1.3/anydoc-swift-0.1.3-darwin-arm64.tar.gz"
      sha256 "bf4d04b50d3cfd596315e466bbae9693050cc9493b66b93215fa222f9489ec35"
    else
      url "https://github.com/tacogips/anydoc-swift/releases/download/v0.1.3/anydoc-swift-0.1.3-darwin-x64.tar.gz"
      sha256 "a814b850e8d2c12a9b1c775250a282326bf2ad8a47b2d9e89ca77252d73988f6"
    end
  end

  def install
    bin.install "bin/anydoc-swift"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anydoc-swift --version")
    (testpath/"data.csv").write("a,b\n1,2\n")
    assert_match "| a | b |", shell_output("#{bin}/anydoc-swift data.csv")
  end
end
