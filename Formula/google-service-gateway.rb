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
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.6/google-service-gateway-0.1.6-darwin-arm64.tar.gz", tag: "v0.1.6"
      sha256 "97028c2f30deecdf955e38ad38d28aaef2763d260113d8e476e707c57c6f2c0d"
    else
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.6/google-service-gateway-0.1.6-darwin-x64.tar.gz", tag: "v0.1.6"
      sha256 "c5d357339b756165ba124ddc6d7881c9f4db03f4503ca00833d5bf80cdb1a59a"
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
    assert_match "0.1.6", shell_output("#{bin}/google-service-gateway-reader --version")
    assert_match "0.1.6", shell_output("#{bin}/google-service-gateway-writer --version")
    assert_match "0.1.6", shell_output("#{bin}/google-service-gateway-admin --version")
    assert_match "0.1.6", shell_output("#{bin}/google-service-gateway-deleter --version")
    assert_match "0.1.6", shell_output("#{bin}/google-service-gateway-auth --version")
  end
end
