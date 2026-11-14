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
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.6/google-documents-gateway-0.3.6-darwin-arm64.tar.gz", tag: "v0.3.6"
      sha256 "deacba601ae743aa21ce82658c91381af30ad23977da6dffaae9b1f42483b8e3"
    else
      url "https://github.com/tacogips/google-documents-gateway/releases/download/v0.3.6/google-documents-gateway-0.3.6-darwin-x64.tar.gz", tag: "v0.3.6"
      sha256 "bcdc271982ae5f090a8fe89051e35ae41b21f9587bd453d7d940f26f98308764"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.3.6", shell_output("#{bin}/google-documents-gateway --version")
  end
end
