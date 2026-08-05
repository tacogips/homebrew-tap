class Ign < Formula
  desc "Template-based code generation CLI tool"
  homepage "https://github.com/tacogips/ign"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.20/ign-0.1.20-darwin-arm64.tar.gz"
      sha256 "5f4d922e5591b4413a0dafa5f4ace3ea79a660ca12b436ddc94774bb27df6d25"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.20/ign-0.1.20-darwin-x64.tar.gz"
      sha256 "cdb0a8e588ce5a9547ed31fd1d2d3ad54f8d5eb46928a06844fd0fb0cd2fe443"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.20/ign-0.1.20-linux-arm64.tar.gz"
      sha256 "c1b88abae1fef436ed9baa4111b6bf61392400282b05d4b2b35a0683880e97c2"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.20/ign-0.1.20-linux-x64.tar.gz"
      sha256 "b63c20485a7b516a77b580295f124aeaecbbb0817c214300fb3f92992f21eb6e"
    end
  end

  def install
    bin.install "bin/ign"
  end

  test do
    assert_equal "0.1.20", shell_output("#{bin}/ign version --short").strip
  end
end
