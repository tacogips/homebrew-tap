class GoogleServiceGateway < Formula
  desc "Google Service Usage reader and writer command line gateways"
  homepage "https://github.com/tacogips/google-service-gateway"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.0/google-service-gateway-0.1.0-darwin-arm64.tar.gz"
      sha256 "65be09f948e6afda1ee1988be3b3f2322306d25708f9334d09aaa67d48849088"
    else
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.0/google-service-gateway-0.1.0-darwin-x64.tar.gz"
      sha256 "4111cd09758c184ba32ce8803fc6917a08609edc306d52ead80df4114d52ff32"
    end
  end

  def install
    bin.install "bin/google-service-gateway-reader"
    bin.install "bin/google-service-gateway-writer"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/google-service-gateway-reader --version")
    assert_match "0.1.0", shell_output("#{bin}/google-service-gateway-writer --version")
  end
end
