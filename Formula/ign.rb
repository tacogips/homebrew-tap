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
      url "https://github.com/tacogips/ign/releases/download/v0.1.22/ign-0.1.22-darwin-arm64.tar.gz"
      sha256 "993422127428715a38b4ccc164e3bbfd308215871474831c77801ff1db2db95e"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.22/ign-0.1.22-darwin-x64.tar.gz"
      sha256 "face5460a0fdb41f5862dbe652cecbfbec6664c8cc1054b517cfc0f086262b4e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.22/ign-0.1.22-linux-arm64.tar.gz"
      sha256 "c972e7d1eccd9b8d557a75ae53086392d94e6ed93af9b24a560756e34e3c834f"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.22/ign-0.1.22-linux-x64.tar.gz"
      sha256 "342a794b475929821306014a9f8b67a4b974d9a69f3124a75c42df152115e06c"
    end
  end

  def install
    bin.install "bin/ign"
  end

  test do
    assert_path_exists bin/"ign"
    assert_predicate bin/"ign", :executable?
  end
end
