class DocumentGateway < Formula
  desc "Least-privilege Google Docs, Sheets, and Drive CLI gateways"
  homepage "https://github.com/tacogips/document-gateway"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/document-gateway/releases/download/v#{version}/document-gateway-#{version}-darwin-arm64.tar.gz"
      sha256 "133acedebb0145d414d49d823ded7c4a32c16c56778224c961252fc3074ccaf7"
    else
      url "https://github.com/tacogips/document-gateway/releases/download/v#{version}/document-gateway-#{version}-darwin-x64.tar.gz"
      sha256 "f98df4ee6f015e92bbd5a83af66a89170ebab422cd1853586d983ede1c4caa47"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/document-gateway --version")
  end
end
