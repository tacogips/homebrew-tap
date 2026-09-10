class CalendarGateway < Formula
  desc "Swift library and local CLI gateway for calendar clients"
  homepage "https://github.com/tacogips/calendar-gateway"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.4/calendar-gateway-0.1.4-darwin-arm64.tar.gz"
      sha256 "56b1e3ce1df3835dd4bb3c2046a654c522cda4eba4a6eb2d508fa79104372903"
    else
      url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.4/calendar-gateway-0.1.4-darwin-x64.tar.gz"
      sha256 "1157f554df7e6a86479916971b2c613584721db2cdbb7ea23634a05db218a375"
    end
  end

  def install
    bin.install "bin/calendar-gateway"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/calendar-gateway --version")
  end
end
