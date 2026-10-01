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
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.5/google-service-gateway-0.1.5-darwin-arm64.tar.gz", tag: "v0.1.5"
      sha256 "48926bbaa5c9b7d5f964374d89e1c2ab169b890627cf1f718bc21e410f534edc"
    else
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.5/google-service-gateway-0.1.5-darwin-x64.tar.gz", tag: "v0.1.5"
      sha256 "1fa9aeecb0de0f094463a6f4a3752fa9e6cc88a81d7fcd50ce83891fc679e8a2"
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
    assert_match "0.1.5", shell_output("#{bin}/google-service-gateway-reader --version")
    assert_match "0.1.5", shell_output("#{bin}/google-service-gateway-writer --version")
    assert_match "0.1.5", shell_output("#{bin}/google-service-gateway-admin --version")
    assert_match "0.1.5", shell_output("#{bin}/google-service-gateway-deleter --version")
    assert_match "0.1.5", shell_output("#{bin}/google-service-gateway-auth --version")
  end
end
