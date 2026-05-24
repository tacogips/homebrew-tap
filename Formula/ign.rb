class Ign < Formula
  desc "Template-based code generation CLI tool"
  homepage "https://github.com/tacogips/ign"
  version "0.1.16"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.16/ign-0.1.16-darwin-arm64.tar.gz"
      sha256 "45b6cc5eac09a2e4181cfb573b08fce1046485dd76366602f12d643e105cb14a"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.16/ign-0.1.16-darwin-x64.tar.gz"
      sha256 "4f20285487d251b80a40026c8c259a93f83624851a9d5bc38b6847164de252d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.16/ign-0.1.16-linux-arm64.tar.gz"
      sha256 "6f2e7912fad8e87849a0a356bbc7002edaf99e5d87b3600b75f45c9b239565f6"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.16/ign-0.1.16-linux-x64.tar.gz"
      sha256 "284fdd9f15c985deaf539242b5d98af3b702cd7d974daef07ca17288f614968a"
    end
  end

  def install
    bin.install "bin/ign"
  end

  test do
    assert_equal "0.1.16", shell_output("#{bin}/ign version --short").strip
  end
end
