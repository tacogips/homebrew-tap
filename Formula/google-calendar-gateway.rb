class GoogleCalendarGateway < Formula
  desc "Swift library and local CLI gateway for calendar clients"
  homepage "https://github.com/tacogips/google-calendar-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.8/google-calendar-gateway-0.1.8-darwin-arm64.tar.gz"
      sha256 "e35a13cf1fd02d5e0b1a636f036cc1d982b62a276e26ac19b7c1becdcfdcf2a9"
    else
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.8/google-calendar-gateway-0.1.8-darwin-x64.tar.gz"
      sha256 "91a11c9b7ebf97f7cf0c3a23f20b5cd781e9d9eba0d6acb505cd6d3af4551cf1"
    end
  end

  def install
    bin.install "bin/google-calendar-gateway-reader", "bin/google-calendar-gateway-writer"
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/google-calendar-gateway-reader --version")
    assert_match "0.1.8", shell_output("#{bin}/google-calendar-gateway-writer --version")
  end
end
