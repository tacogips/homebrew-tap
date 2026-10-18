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
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.10/x-gateway-0.1.10-darwin-arm64.tar.gz"
      sha256 "0cbf85a0c4f476b94cc5952bf30c96649637d003de06fa34052f7869fa75fdda"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.10/x-gateway-0.1.10-darwin-x64.tar.gz"
      sha256 "943bba6540590c7c4b1d8bba9ba997d61ae21cd8fd4bfdd5691710bbbcf3ae65"
    end
  end

  def install
    bin.install "bin/x-gateway-reader"
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/x-gateway-reader version")
  end
end
