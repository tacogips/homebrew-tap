class GoogleServiceGateway < Formula
  desc "Google Service Usage, API-key, and OAuth command-line gateways"
  homepage "https://github.com/tacogips/google-service-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.1/google-service-gateway-0.1.1-darwin-arm64.tar.gz", tag: "v0.1.1"
      sha256 "eefd29835923148d58693613b1e56dff1a742fcbb9436eaf210e44e3717417d5"
    else
      url "https://github.com/tacogips/google-service-gateway/releases/download/v0.1.1/google-service-gateway-0.1.1-darwin-x64.tar.gz", tag: "v0.1.1"
      sha256 "250ede3ab0872fbab72b8eed2daaccb10e35bf68a5499094516cee131046532a"
    end
  end

  def install
    bin.install "bin/google-service-gateway-reader"
    bin.install "bin/google-service-gateway-writer"
    bin.install "bin/google-service-gateway-auth"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/google-service-gateway-reader --version")
    assert_match "0.1.1", shell_output("#{bin}/google-service-gateway-writer --version")
    assert_match "0.1.1", shell_output("#{bin}/google-service-gateway-auth --version")
  end
end
