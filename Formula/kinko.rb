class Kinko < Formula
  desc "Encrypted environment variable manager for repository and shared scopes"
  homepage "https://github.com/tacogips/kinko"
  version "0.1.7"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.7/kinko_0.1.7_darwin_arm64.tar.gz"
      sha256 "608bcfabfa4b8b6110c7ac76f82c22d6e76425ae7a57f6eb5abc9e29e3f9d290"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.7/kinko_0.1.7_darwin_amd64.tar.gz"
      sha256 "1e096b5aacef6a31de13013a99bcb580adee9b18352efe1209cf4464782d1157"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.7/kinko_0.1.7_linux_arm64.tar.gz"
      sha256 "91c69e55b6a214c450766ae3d42a7815c0bbbbbd6fcdf6c63b5ce8c205fa884f"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.7/kinko_0.1.7_linux_amd64.tar.gz"
      sha256 "899c8511218c770abd6089f8f6ea56ae5e40222df5f9427af087d4a7031a3bcf"
    end
  end

  def install
    bin.install Dir["kinko_*"].first => "kinko"
  end

  test do
    assert_equal "0.1.7", shell_output("#{bin}/kinko version").strip
  end
end
