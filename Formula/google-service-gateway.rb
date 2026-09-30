class GoogleServiceGateway < Formula
  desc "Google Service Usage, Cloud Billing, API-key, and OAuth command-line gateways"
  homepage "https://github.com/tacogips/google-service-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.2/google-service-gateway-0.1.2-darwin-arm64.tar.gz", tag: "v0.1.2"
      sha256 "bdbf757f85e71651a77aec2cf26cb75ac80b892db30b055f2da43b0dc6e8e815"
    else
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.2/google-service-gateway-0.1.2-darwin-x64.tar.gz", tag: "v0.1.2"
      sha256 "9b4b1cfadb02e6a7e91b87b7b62b84f37a59ae2055d52a275cb6c6b879e0d6bb"
    end
  end

  def install
    bin.install "bin/google-service-gateway-reader"
    bin.install "bin/google-service-gateway-writer"
    bin.install "bin/google-service-gateway-admin"
    bin.install "bin/google-service-gateway-deleter"
    bin.install "bin/google-service-gateway-auth"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/google-service-gateway-reader --version")
    assert_match "0.1.2", shell_output("#{bin}/google-service-gateway-writer --version")
    assert_match "0.1.2", shell_output("#{bin}/google-service-gateway-admin --version")
    assert_match "0.1.2", shell_output("#{bin}/google-service-gateway-deleter --version")
    assert_match "0.1.2", shell_output("#{bin}/google-service-gateway-auth --version")
  end
end
