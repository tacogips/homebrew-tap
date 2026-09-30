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
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.6/google-calendar-gateway-0.1.6-darwin-arm64.tar.gz"
      sha256 "ede6d41555f2963d8c42d641cae757eb8a1c497aa0caaa3ffadc835fe64b38ed"
    else
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.6/google-calendar-gateway-0.1.6-darwin-x64.tar.gz"
      sha256 "8a1c570dea53ea5d7dd20eb367548c06196766dfb2a96a1b3cd2a5c0c49b5668"
    end
  end

  def install
    bin.install "bin/google-calendar-gateway-reader", "bin/google-calendar-gateway-writer"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/google-calendar-gateway-reader --version")
    assert_match "0.1.6", shell_output("#{bin}/google-calendar-gateway-writer --version")
  end
end
