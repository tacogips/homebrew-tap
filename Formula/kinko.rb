class Kinko < Formula
  desc "Local encrypted environment-variable manager"
  homepage "https://github.com/tacogips/kinko"
  version "0.1.11"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.11/kinko-0.1.11-darwin-arm64.tar.gz"
      sha256 "a361f4862cb7e8e281fcfb5ac6fbf0ac142dc753ee2b9bb76e35ade138a4e4c2"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.11/kinko-0.1.11-darwin-x64.tar.gz"
      sha256 "10f7e3ee0ec969d5530f0c2ed0369c9baa6203a1c8e079aadd0b3baafc1db328"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.11/kinko-0.1.11-linux-arm64.tar.gz"
      sha256 "a284aaa3d742b29d302a9a1fa67b14ec51ea1e82368b9f0ea787c950cd7d7a3f"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.11/kinko-0.1.11-linux-x64.tar.gz"
      sha256 "f5b6455085ac3c7902b5cac6bc721b5552f890219f264b284ca91aecfad80147"
    end
  end

  def install
    bin.install "bin/kinko"
  end

  test do
    assert_equal "0.1.11", shell_output("#{bin}/kinko version").strip
    assert_path_exists bin/"kinko"
    assert_predicate bin/"kinko", :executable?
  end
end
