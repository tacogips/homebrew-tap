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
      url "https://github.com/tacogips/google-document-ocr-gateway/releases/download/v0.1.4/google-document-ocr-gateway-0.1.4-darwin-arm64.tar.gz"
      sha256 "c9acaa99f9c92659ca0f0dc13fe79819e2571902b0a0f50c54cddf85213e457e"
    else
      url "https://github.com/tacogips/google-document-ocr-gateway/releases/download/v0.1.4/google-document-ocr-gateway-0.1.4-darwin-x64.tar.gz"
      sha256 "bc0846c6b468ca74185438b03780539fc3015e5360301070f2fed98d0801da2f"
    end
  end

  def install
    libexec.install Dir["bin/*"]
    bin.write_exec_script libexec/"google-document-ocr-gateway"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/google-document-ocr-gateway --version")
  end
end
