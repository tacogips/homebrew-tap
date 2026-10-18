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
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.11/google-calendar-gateway-0.1.11-darwin-arm64.tar.gz"
      sha256 "91bf0a224de6fc7c0b72ee39dad6d2f9d67a7fbb1b82b5996526011fa1ed1f2e"
    else
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.11/google-calendar-gateway-0.1.11-darwin-x64.tar.gz"
      sha256 "b12aa71dbfd61cc12747faf74a4b0594675b4eaf2dcf0e0cd574e0d2b46460f1"
    end
  end

  def install
    bin.install "bin/google-calendar-gateway-reader", "bin/google-calendar-gateway-writer"
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/google-calendar-gateway-reader --version")
    assert_match "0.1.11", shell_output("#{bin}/google-calendar-gateway-writer --version")
  end
end
