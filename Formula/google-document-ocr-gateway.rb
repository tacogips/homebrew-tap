class GoogleDocumentOcrGateway < Formula
  desc "Google Document AI command-line client"
  homepage "https://github.com/tacogips/google-document-ocr-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-document-ocr-gateway/releases/download/v0.1.1/google-document-ocr-gateway-0.1.1-darwin-arm64.tar.gz"
      sha256 "d5a8d26365744830f610ae087020bc4f6d5ce812535d45a4e7497f32d1bdc477"
    else
      url "https://github.com/tacogips/google-document-ocr-gateway/releases/download/v0.1.1/google-document-ocr-gateway-0.1.1-darwin-x64.tar.gz"
      sha256 "4935a44927984be38edc6f522b3f44b09764d57439da00dc0c2e99b6220e73a2"
    end
  end

  def install
    libexec.install Dir["bin/*"]
    bin.write_exec_script libexec/"google-document-ocr-gateway"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/google-document-ocr-gateway --version")
  end
end
