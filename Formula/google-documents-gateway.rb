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
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.4/google-documents-gateway-0.3.4-darwin-arm64.tar.gz", tag: "v0.3.4"
      sha256 "a81ebecd5e355b9266b23fbf299987b5dc0856dbefdb028d55c45b5abd4b114a"
    else
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.4/google-documents-gateway-0.3.4-darwin-x64.tar.gz", tag: "v0.3.4"
      sha256 "0ac6171486f9df8c64f342bf029abfc9ee6520cc33cc8b2f332daa01202ec7ae"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.3.4", shell_output("#{bin}/google-documents-gateway --version")
  end
end
