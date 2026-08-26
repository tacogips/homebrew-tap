class GoogleDocumentsGateway < Formula
  desc "Least-privilege Google Docs, Sheets, and Drive CLI gateways"
  homepage "https://github.com/tacogips/google-documents-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.2.2/google-documents-gateway-0.2.2-darwin-arm64.tar.gz", tag: "v0.2.2"
      sha256 "3af15f2ebccaa8753dcd53e8911f023536d92247f02b194be27a2777f4eb8ecc"
    else
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.2.2/google-documents-gateway-0.2.2-darwin-x64.tar.gz", tag: "v0.2.2"
      sha256 "546800ac8cc72ecb2a673951443c0eebf7bff08dcc1de920c5e5d8cfc7600bac"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/google-documents-gateway --version")
  end
end
