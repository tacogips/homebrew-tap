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
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.9/google-calendar-gateway-0.1.9-darwin-arm64.tar.gz"
      sha256 "9db6b472124583a0b64cba114eda000653808a37e4aff2a77b3b1a317ddd2bb0"
    else
      url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.9/google-calendar-gateway-0.1.9-darwin-x64.tar.gz"
      sha256 "2ead264e75a6ce8937516363d881de4cc1faba0e33094064eec2efd6085ce5cd"
    end
  end

  def install
    bin.install "bin/google-calendar-gateway-reader", "bin/google-calendar-gateway-writer"
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/google-calendar-gateway-reader --version")
    assert_match "0.1.9", shell_output("#{bin}/google-calendar-gateway-writer --version")
  end
end
