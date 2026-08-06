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
      url "https://github.com/tacogips/anydoc-swift/releases/download/v0.1.1/anydoc-swift-0.1.1-darwin-arm64.tar.gz"
      sha256 "25de4590c0ad34aae3bead5eb29dc68d368610c5848dea580036d56e649d1136"
    else
      url "https://github.com/tacogips/anydoc-swift/releases/download/v0.1.1/anydoc-swift-0.1.1-darwin-x64.tar.gz"
      sha256 "2d3b9475e567923c65717b631eea275417ea3447969ccd91565f31a1b640f993"
    end
  end

  def install
    bin.install "bin/anydoc-swift"
    doc.install "README.md", "LICENSE", "THIRD-PARTY-LICENSES.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anydoc-swift --version")
    (testpath/"data.csv").write("a,b\n1,2\n")
    assert_match "| a | b |", shell_output("#{bin}/anydoc-swift data.csv")
  end
end
