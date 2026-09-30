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
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.5/google-documents-gateway-0.3.5-darwin-arm64.tar.gz", tag: "v0.3.5"
      sha256 "3f6d19c274100e67a567000cf737396998f6daef0221bbfc025c8d3592b4643a"
    else
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.5/google-documents-gateway-0.3.5-darwin-x64.tar.gz", tag: "v0.3.5"
      sha256 "bda319476e41a2cc69200aea96c1422acd4b4072aff275ba1da44dc4d0e825a1"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.3.5", shell_output("#{bin}/google-documents-gateway --version")
  end
end
