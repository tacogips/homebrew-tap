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
      url "https://github.com/tacogips/ign/releases/download/v0.1.23/ign-0.1.23-darwin-arm64.tar.gz?version=0.1.23"
      sha256 "43efaceb9cebd8d012fe3ba7ab242173c7187927903180890981d325bca136fb"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.23/ign-0.1.23-darwin-x64.tar.gz?version=0.1.23"
      sha256 "389899bc321c7eaf0727120415a979c55f5c846969f0ffb8132c44ba9f4d1429"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.23/ign-0.1.23-linux-arm64.tar.gz?version=0.1.23"
      sha256 "18fe91127c5b4ad6f7c15dd997506b819462d99b69f3f09b249b6f4809417eb7"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.23/ign-0.1.23-linux-x64.tar.gz?version=0.1.23"
      sha256 "ec906bb822002fc3c11a4c3d8c9f36fdb405ceb7d6cfbfeebe982c8751e6d8f7"
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
