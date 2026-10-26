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
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.27/x-gateway-0.1.27-darwin-arm64.tar.gz"
      sha256 "cabd2b66597883a7247da989634e22793b3e775a47bd99752dc20842d0efe77e"
    else
      url "https://github.com/tacogips/x-gateway/releases/download/v0.1.27/x-gateway-0.1.27-darwin-x64.tar.gz"
      sha256 "5c273d8056910c469e62d73df170dabac66b65997a6272c6a9913f409fd9af60"
    end
  end

  def install
    bin.install "bin/x-gateway-reader"
  end

  test do
    assert_match "0.1.27", shell_output("#{bin}/x-gateway-reader version")
  end
end
