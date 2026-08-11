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
      url "https://github.com/tacogips/ign/releases/download/v0.1.24/ign-0.1.24-darwin-arm64.tar.gz?version=0.1.24"
      sha256 "5e3fcbbc475db47785e1fb1c43057bc3aa569578bf15c9884119750c962a4645"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.24/ign-0.1.24-darwin-x64.tar.gz?version=0.1.24"
      sha256 "a0595c5d91335637754f04da87061cd0fe0c609f53eb7b9f0788b794e5366024"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.24/ign-0.1.24-linux-arm64.tar.gz?version=0.1.24"
      sha256 "5fcb85978eaa9895d5e08c72fdde57d1e333bc2a187303b7b2b217df3cdba24d"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.24/ign-0.1.24-linux-x64.tar.gz?version=0.1.24"
      sha256 "cf0075910806381b698f0560af3fd96f2618edbe900556a392dc2a09dcd1255e"
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
