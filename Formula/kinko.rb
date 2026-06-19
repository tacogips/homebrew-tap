class Kinko < Formula
  desc "Encrypted environment variable manager for repository and shared scopes"
  homepage "https://github.com/tacogips/kinko"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.2/kinko_0.1.2_darwin_arm64.tar.gz"
      sha256 "6bb7887d05f26cc8e3e2520b3271b7fe47748823c779a9d4df905f3500dba86e"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.2/kinko_0.1.2_darwin_amd64.tar.gz"
      sha256 "2391e92a89040458aa8088c334a21fb4f32346b2ba48860ea3604c466c5de65c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.2/kinko_0.1.2_linux_arm64.tar.gz"
      sha256 "80e65d6e7c439bb714f0fe9a0d914fb2e097f9c70163b2b7ea732fe75a539a68"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.2/kinko_0.1.2_linux_amd64.tar.gz"
      sha256 "933b8e706ada9d0d8db90540b279bb3059a9f800c43f09b800fa76edc6f25687"
    end
  end

  def install
    bin.install Dir["kinko_*"].first => "kinko"
  end

  test do
    assert_equal "0.1.2", shell_output("#{bin}/kinko version").strip
  end
end
