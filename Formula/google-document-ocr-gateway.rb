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
      url "https://github.com/tacogips/google-document-ocr-gateway/releases/download/v0.1.3/google-document-ocr-gateway-0.1.3-darwin-arm64.tar.gz"
      sha256 "f80f9cfa8cbd24b0c9382bd8cfd24659105422b396e308c934de17a28c59df38"
    else
      url "https://github.com/tacogips/google-document-ocr-gateway/releases/download/v0.1.3/google-document-ocr-gateway-0.1.3-darwin-x64.tar.gz"
      sha256 "debef30be5d0b66b7a1d945a0a50b4bff8d298ebdef4ab63454d2c4f2d063ebc"
    end
  end

  def install
    libexec.install Dir["bin/*"]
    bin.write_exec_script libexec/"google-document-ocr-gateway"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/google-document-ocr-gateway --version")
  end
end
