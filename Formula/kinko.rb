class Kinko < Formula
  desc "Encrypted environment variable manager for repository and shared scopes"
  homepage "https://github.com/tacogips/kinko"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.9/kinko_0.1.9_darwin_arm64.tar.gz"
      sha256 "171066fe4f035efb6c81cd9f98be4db59ced2d165ed3e4d598cd805c57a0de05"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.9/kinko_0.1.9_darwin_amd64.tar.gz"
      sha256 "a4ac42c209255229d02dd14b84cfd18fa0ab3dd134376a41b28728be6d6616aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.9/kinko_0.1.9_linux_arm64.tar.gz"
      sha256 "eedeccd8d991fcbdd30de0a74159b9f66ad88666794f71310c2bdcb5c910d4ae"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.9/kinko_0.1.9_linux_amd64.tar.gz"
      sha256 "9386aa86c2662a2f1ba58784d2fccf681af3758eead3228d27e926e20229384b"
    end
  end

  def install
    bin.install Dir["kinko_*"].first => "kinko"
  end

  test do
    assert_equal "0.1.9", shell_output("#{bin}/kinko version").strip
  end
end
