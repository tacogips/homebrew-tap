class GoogleDocumentOcrGateway < Formula
  desc "Google Document AI command-line client"
  homepage "https://github.com/tacogips/google-document-ocr-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-document-ocr-gateway/releases/download/v0.1.2/google-document-ocr-gateway-0.1.2-darwin-arm64.tar.gz"
      sha256 "e050e66c1539bd0f371834e02f36a221f4a07a5e97e8ee94aaf532d3286f4dd0"
    else
      url "https://github.com/tacogips/google-document-ocr-gateway/releases/download/v0.1.2/google-document-ocr-gateway-0.1.2-darwin-x64.tar.gz"
      sha256 "7794a18a76d8efc9793f3929503c4b75ced24253582d1cd8de32d0793694ca49"
    end
  end

  def install
    libexec.install Dir["bin/*"]
    bin.write_exec_script libexec/"google-document-ocr-gateway"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/google-document-ocr-gateway --version")
  end
end
