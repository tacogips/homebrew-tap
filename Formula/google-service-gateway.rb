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
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.7/google-service-gateway-0.1.7-darwin-arm64.tar.gz", tag: "v0.1.7"
      sha256 "e328f4b0f0929b25e99777079455590e9d3728e86c8b76dd37f22bfddab9fecb"
    else
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.7/google-service-gateway-0.1.7-darwin-x64.tar.gz", tag: "v0.1.7"
      sha256 "181418f5674fafb6b354df2ae676fbde54e9b932bcdcfb7a59766ba0a0ebae20"
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
    assert_match "0.1.7", shell_output("#{bin}/google-service-gateway-reader --version")
    assert_match "0.1.7", shell_output("#{bin}/google-service-gateway-writer --version")
    assert_match "0.1.7", shell_output("#{bin}/google-service-gateway-admin --version")
    assert_match "0.1.7", shell_output("#{bin}/google-service-gateway-deleter --version")
    assert_match "0.1.7", shell_output("#{bin}/google-service-gateway-auth --version")
  end
end
