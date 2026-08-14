class DocumentGateway < Formula
  desc "Least-privilege Google Docs, Sheets, and Drive CLI gateways"
  homepage "https://github.com/tacogips/document-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/document-gateway/releases/download/v0.2.0/document-gateway-0.2.0-darwin-arm64.tar.gz", tag: "v0.2.0"
      sha256 "4c8f3c15d464966b11bfe42a221ce7881f9e06ba103702920cee9bfb3aed8379"
    else
      url "https://github.com/tacogips/document-gateway/releases/download/v0.2.0/document-gateway-0.2.0-darwin-x64.tar.gz", tag: "v0.2.0"
      sha256 "11187e3669aa48b9908187f9a7f454624ebc8adfd9d5742c89b6efdc345ff8f4"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/document-gateway --version")
  end
end
