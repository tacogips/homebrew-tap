class CalendarGateway < Formula
  desc "Swift library and local CLI gateway for calendar clients"
  homepage "https://github.com/tacogips/calendar-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.5/calendar-gateway-0.1.5-darwin-arm64.tar.gz"
      sha256 "7853d21cae71c6d07a7c43feae63d074cf1a57986c59abe4df0cb8e144040280"
    else
      url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.5/calendar-gateway-0.1.5-darwin-x64.tar.gz"
      sha256 "a4897f339200c02e27fb358b3cce92f280f441a88694353c78762eac5ea62a5c"
    end
  end

  def install
    bin.install "bin/calendar-gateway"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/calendar-gateway --version")
  end
end
