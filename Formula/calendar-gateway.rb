class CalendarGateway < Formula
  desc "Swift library and local CLI gateway for calendar clients"
  homepage "https://github.com/tacogips/calendar-gateway"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.1/calendar-gateway-0.1.1-darwin-arm64.tar.gz"
      sha256 "69129b6cfeabdff381ea346dddabef512ffa178887479e3cb7ee0065c273bff6"
    else
      url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.1/calendar-gateway-0.1.1-darwin-x64.tar.gz"
      sha256 "84a59d72dfa9d93c1b9238fd3a24b7a37c56acef6938f1e7378a62cf78a98fac"
    end
  end

  def install
    bin.install "bin/calendar-gateway"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/calendar-gateway --version")
  end
end
