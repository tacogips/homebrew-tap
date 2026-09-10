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
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.2/google-documents-gateway-0.3.2-darwin-arm64.tar.gz", tag: "v0.3.2"
      sha256 "8d014437013bd4b9ce09f80c9c518ad491b3d0cb298cd2097f5ad413619e9a9d"
    else
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.2/google-documents-gateway-0.3.2-darwin-x64.tar.gz", tag: "v0.3.2"
      sha256 "4f46a6b64859358faf6bfbdd9efcaa0decb3f02ac4f4595f988015fea0d94deb"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.3.2", shell_output("#{bin}/google-documents-gateway --version")
  end
end
