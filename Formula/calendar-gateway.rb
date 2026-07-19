class CalendarGateway < Formula
  desc "Swift library and local CLI gateway for calendar clients"
  homepage "https://github.com/tacogips/calendar-gateway"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.2/calendar-gateway-0.1.2-darwin-arm64.tar.gz"
      sha256 "2fa110b9d8f41b5c61aa4d0fefb4110b4aa57d0aee2fc46df4faaab001f086a9"
    else
      url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.2/calendar-gateway-0.1.2-darwin-x64.tar.gz"
      sha256 "cdf4da98d835a4c0ec49aff673b967a67d8568d8bc17d8ca019d49887da1ab01"
    end
  end

  def install
    bin.install "bin/calendar-gateway"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/calendar-gateway --version")
  end
end
