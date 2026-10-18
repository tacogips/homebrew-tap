class XGatewayReader < Formula
  desc "Read-only X API gateway CLI"
  homepage "https://github.com/tacogips/x-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.8/x-gateway-0.1.8-darwin-arm64.tar.gz"
      sha256 "f90976c549481c66e152d08318ed50615f683c6d9a215d264dc1ccd4bd16f5bb"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.8/x-gateway-0.1.8-darwin-x64.tar.gz"
      sha256 "6b1f0050051febcf8d911da8968ad4301ee2f8b75a3d17a3dd804830741a327b"
    end
  end

  def install
    bin.install "bin/x-gateway-reader"
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/x-gateway-reader version")
  end
end
