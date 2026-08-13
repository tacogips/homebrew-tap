class WebGateway < Formula
  desc "News collection gateway with LLM-learned, SQLite-persisted fetch strategies"
  homepage "https://github.com/tacogips/web-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/web-gateway/releases/download/v0.1.1/web-gateway-0.1.1-darwin-arm64.tar.gz"
      sha256 "36d83219aae3b571fa3922a1b50007dc992b101bccec98f74e809bc748c3ff47"
    else
      url "https://github.com/tacogips/web-gateway/releases/download/v0.1.1/web-gateway-0.1.1-darwin-x64.tar.gz"
      sha256 "91233736f3c840da172d2f576b38b565ae7d66749d17d35a7a831ecdb6a673ae"
    end
  end

  def install
    bin.install "bin/web-gateway"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/web-gateway --version")
  end
end
