class Ign < Formula
  desc "Template-based code generation CLI tool"
  homepage "https://github.com/tacogips/ign"
  version "0.1.17"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.17/ign-0.1.17-darwin-arm64.tar.gz"
      sha256 "74c5e2bf6cf58a5433cd9ed89a32f61aa3290e158941d010b29965ab51b4d350"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.17/ign-0.1.17-darwin-x64.tar.gz"
      sha256 "f7604a7d49141de6531a6f9166fa140562187dc9588107707d9d5a1f6dfae550"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.17/ign-0.1.17-linux-arm64.tar.gz"
      sha256 "60deab8250e3c7b6fac0a52a66af699fe86381d27bbbe642686ebc1bae41c271"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.17/ign-0.1.17-linux-x64.tar.gz"
      sha256 "33e72185d5daff4f211aff7553867daab90af48d024a73918cb999d217358dbe"
    end
  end

  def install
    bin.install "bin/ign"
  end

  test do
    assert_equal "0.1.17", shell_output("#{bin}/ign version --short").strip
  end
end
