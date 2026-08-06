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
      url "https://github.com/tacogips/anydoc-swift/releases/download/v0.1.2/anydoc-swift-0.1.2-darwin-arm64.tar.gz"
      sha256 "ec941df3e84fe01c0b016ec2c9fd1ebaddccdef0bc6fe668fab27b81fb682e62"
    else
      url "https://github.com/tacogips/anydoc-swift/releases/download/v0.1.2/anydoc-swift-0.1.2-darwin-x64.tar.gz"
      sha256 "7d845941c10bc98870d7f0b88ae17287c5f99138cbe4eb5de2fd531ea28a0792"
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
