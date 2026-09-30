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
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.4/google-service-gateway-0.1.4-darwin-arm64.tar.gz", tag: "v0.1.4"
      sha256 "c620d7ac43151015a179ea0e468448525c49bba1db35ec491b0766d2840d6976"
    else
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.4/google-service-gateway-0.1.4-darwin-x64.tar.gz", tag: "v0.1.4"
      sha256 "c3e0cba34601b88f5493023200e5eb890476d68ff1b110cc7385ac408c6e45a5"
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
    assert_match "0.1.4", shell_output("#{bin}/google-service-gateway-reader --version")
    assert_match "0.1.4", shell_output("#{bin}/google-service-gateway-writer --version")
    assert_match "0.1.4", shell_output("#{bin}/google-service-gateway-admin --version")
    assert_match "0.1.4", shell_output("#{bin}/google-service-gateway-deleter --version")
    assert_match "0.1.4", shell_output("#{bin}/google-service-gateway-auth --version")
  end
end
