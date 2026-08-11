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
      url "https://github.com/tacogips/ign/releases/download/v0.1.21/ign-0.1.21-darwin-arm64.tar.gz"
      sha256 "e1df70301ba4de4800f3e8c11cf1699bf7568e9382e762313f9f13042cd9a754"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.21/ign-0.1.21-darwin-x64.tar.gz"
      sha256 "a55bbe2fb50fbac871db46a4ec3804374047eedc7010edf44ad898e7f51f895b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.21/ign-0.1.21-linux-arm64.tar.gz"
      sha256 "90b26775bce9e1950e6d96d898f50f9c59fba51a94ba650a10c171301b507571"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.21/ign-0.1.21-linux-x64.tar.gz"
      sha256 "f167ee91315e923f8ee17e27dcbfdad1860ce089e5adb1239f63fd5bbe907e43"
    end
  end

  def install
    bin.install "bin/ign"
  end

  test do
    assert_equal "0.1.21", shell_output("#{bin}/ign version --short").strip
  end
end
