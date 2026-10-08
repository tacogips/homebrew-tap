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
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.10/google-calendar-gateway-0.1.10-darwin-arm64.tar.gz"
      sha256 "2dd64c2227eec16cc4a7e6ea0d9231ca7f04af91edb21aa5e6ef7c0c80bcbaf5"
    else
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.10/google-calendar-gateway-0.1.10-darwin-x64.tar.gz"
      sha256 "0d821b926341e13f6bc84adb4e05cee26d93ab95b68a0051d52ad3be918dde00"
    end
  end

  def install
    bin.install "bin/google-calendar-gateway-reader", "bin/google-calendar-gateway-writer"
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/google-calendar-gateway-reader --version")
    assert_match "0.1.10", shell_output("#{bin}/google-calendar-gateway-writer --version")
  end
end
