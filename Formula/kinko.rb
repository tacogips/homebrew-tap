class Kinko < Formula
  desc "Encrypted environment variable manager for repository and shared scopes"
  homepage "https://github.com/tacogips/kinko"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.4/kinko_0.1.4_darwin_arm64.tar.gz"
      sha256 "63ccca0901806a854c42a5f16b9a870cf8c9f3af51d8e3d2dac20cc74422b536"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.4/kinko_0.1.4_darwin_amd64.tar.gz"
      sha256 "9aa2ace6dffbd175a074d73d46faada95b50d8d1db45a30a7e986d9d8a4656ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.4/kinko_0.1.4_linux_arm64.tar.gz"
      sha256 "132acfc6dd86775af307aeee07b2f57a43773e9a9b8091c8223a5f5140fcc586"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.4/kinko_0.1.4_linux_amd64.tar.gz"
      sha256 "449ee4076a84cfce3cfba8ef1c95bea8932030ea28013e6f874190858135348d"
    end
  end

  def install
    bin.install Dir["kinko_*"].first => "kinko"
  end

  test do
    assert_equal "0.1.4", shell_output("#{bin}/kinko version").strip
  end
end
