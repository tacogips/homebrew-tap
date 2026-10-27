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
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.8/google-service-gateway-0.1.8-darwin-arm64.tar.gz", tag: "v0.1.8"
      sha256 "25ca9de77e9ffbfce7109f73f43460af206cddaf8472440d83e4bb88eac2e827"
    else
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.8/google-service-gateway-0.1.8-darwin-x64.tar.gz", tag: "v0.1.8"
      sha256 "6879e7bf724b8e0b8da61214455555153acdd1ecd7cf18a3d1375387b9927cee"
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
    assert_match "0.1.8", shell_output("#{bin}/google-service-gateway-reader --version")
    assert_match "0.1.8", shell_output("#{bin}/google-service-gateway-writer --version")
    assert_match "0.1.8", shell_output("#{bin}/google-service-gateway-admin --version")
    assert_match "0.1.8", shell_output("#{bin}/google-service-gateway-deleter --version")
    assert_match "0.1.8", shell_output("#{bin}/google-service-gateway-auth --version")
  end
end
