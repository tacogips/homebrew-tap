class XGatewayWriter < Formula
  desc "Write-capable X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.4/x-gateway-0.1.4-darwin-arm64.tar.gz"
      sha256 "e8abed1e98ab4bce44d72e9589fedc9e8c2049870f21f4ce1a18faa51245fdc6"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.4/x-gateway-0.1.4-darwin-x64.tar.gz"
      sha256 "c99728e1c13f06870aee21e52263a6a475b196217bb93e4cff4e0c1fd97a7cd2"
    end
  end

  def install
    bin.install "bin/x-gateway-writer"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/x-gateway-writer version")
  end
end
