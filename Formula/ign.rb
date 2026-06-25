class Ign < Formula
  desc "Template-based code generation CLI tool"
  homepage "https://github.com/tacogips/ign"
  version "0.1.18"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.18/ign-0.1.18-darwin-arm64.tar.gz"
      sha256 "472911aa9b819f1e29b8b0d91a1a0836a8af69884ec3a58aa66ae3529188a96a"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.18/ign-0.1.18-darwin-x64.tar.gz"
      sha256 "98011f0ab76823daf914ce69fa86ed692d74885142e7b5297353ed4aaad20351"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.18/ign-0.1.18-linux-arm64.tar.gz"
      sha256 "0d93557cc320b3d4f8ec9c59390e9a7b0da205bd528bb85fb00405d7bd096761"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.18/ign-0.1.18-linux-x64.tar.gz"
      sha256 "0aa3f3483a5e327fcca77aa6267912352ce76ea397d139ba24f64792e778bbf1"
    end
  end

  def install
    bin.install "bin/ign"
  end

  test do
    assert_equal "0.1.18", shell_output("#{bin}/ign version --short").strip
  end
end
