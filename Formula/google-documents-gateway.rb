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
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.1/google-documents-gateway-0.3.1-darwin-arm64.tar.gz", tag: "v0.3.1"
      sha256 "b45a1c6f41df219cfed5eb1c26aecdb9c1aa52e967215ee627d320dbe9df3995"
    else
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.1/google-documents-gateway-0.3.1-darwin-x64.tar.gz", tag: "v0.3.1"
      sha256 "4abbfb51ad49bbb5d4478a162569d7568b2dbf51987e057acca93ce82d461128"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/google-documents-gateway --version")
  end
end
