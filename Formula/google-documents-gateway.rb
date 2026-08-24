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
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.2.1/google-documents-gateway-0.2.1-darwin-arm64.tar.gz", tag: "v0.2.1"
      sha256 "75aaaaab16bf455aa3869a3f4a769621f44033573fd3d63f6f50f4362837872b"
    else
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.2.1/google-documents-gateway-0.2.1-darwin-x64.tar.gz", tag: "v0.2.1"
      sha256 "6d9cf546cc214bfc1bfacd95a573bc7d7866e6d32f236101ea1921acf3e4367c"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/google-documents-gateway --version")
  end
end
