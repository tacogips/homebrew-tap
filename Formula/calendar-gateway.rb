class App < Formula
  desc "A Swift command line tool"
  homepage "https://github.com/user/repo"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/user/repo/releases/download/v0.1.3/calendar-gateway-0.1.3-darwin-arm64.tar.gz"
      sha256 "1cd0704bee770cef42e002565f3f54d753d00b036256a7a718fbb291e86b2217"
    else
      url "https://github.com/user/repo/releases/download/v0.1.3/calendar-gateway-0.1.3-darwin-x64.tar.gz"
      sha256 "46edaa0cbef2e0a2777ae7e471a420f0fbc4f294c1dae4c083c4b160648b9488"
    end
  end

  def install
    bin.install "bin/calendar-gateway"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/calendar-gateway --version")
  end
end
