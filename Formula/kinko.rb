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
      url "https://github.com/tacogips/kinko/releases/download/v0.1.10/kinko_0.1.10_darwin_arm64.tar.gz"
      sha256 "46a9a05bf3ab76cd6f9fb950b3aa7a2a7c8e4e2f262fdd5a1aae3b9904d9f73f"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.10/kinko_0.1.10_darwin_amd64.tar.gz"
      sha256 "ba1262ae25bc4e16e60dad0372d8cb38ccce76a8e523702ebe9e0263842823ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.10/kinko_0.1.10_linux_arm64.tar.gz"
      sha256 "0ca7be71a7f714762d6e1323bf97790faa4a87ef297c2d1ff8764e4f4b785177"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.10/kinko_0.1.10_linux_amd64.tar.gz"
      sha256 "5054753a8254748db761cd689f07b964e10509ed7d67bf52e261d6f08f126281"
    end
  end

  def install
    bin.install Dir["kinko_*"].first => "kinko"
  end

  test do
    assert_equal "0.1.10", shell_output("#{bin}/kinko version").strip
  end
end
