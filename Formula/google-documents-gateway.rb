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
      sha256 "615a23a029eca268cc5a02e365af143320b25e04b3ea13d2556e07f974328682"
    else
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.2.2/google-documents-gateway-0.2.2-darwin-x64.tar.gz", tag: "v0.2.2"
      sha256 "a66867e5f13994cd69053836a47e260b98d7a72ae78d4de6b2d2d3e23d8d9535"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.2.2", shell_output("#{bin}/google-documents-gateway --version")
  end
end
