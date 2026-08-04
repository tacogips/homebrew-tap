class Ign < Formula
  desc "Template-based code generation CLI tool"
  homepage "https://github.com/tacogips/ign"
  version "0.1.19"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.19/ign-0.1.19-darwin-arm64.tar.gz"
      sha256 "3527ce5aaeb1a6d469274342cb33a41f8988682d37dc138bd1a162d08fa348c9"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.19/ign-0.1.19-darwin-x64.tar.gz"
      sha256 "f7990530ab2d28d11a3492673765afa848b353fbf3a92710e37ab80d836fcc51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.19/ign-0.1.19-linux-arm64.tar.gz"
      sha256 "f6d12cfe21069dc66be5438eda3c39d7add1689495ccee02db5108edcb5638c2"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.19/ign-0.1.19-linux-x64.tar.gz"
      sha256 "0f9f6555f962f9c01d9e9d36d9b0ededd0160b0a70682e64b2d9e09927f142e7"
    end
  end

  def install
    bin.install "bin/ign"
  end

  test do
    assert_equal "0.1.19", shell_output("#{bin}/ign version --short").strip
  end
end
