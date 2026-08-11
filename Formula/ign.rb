class Ign < Formula
  desc "Template-based code generation CLI tool"
  homepage "https://github.com/tacogips/ign"
  version "0.1.25"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.25/ign-0.1.25-darwin-arm64.tar.gz"
      sha256 "293eeded2fe73b85cb4a45e3452eb54fc460cac99d90cfe3a18228956ca8f46f"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.25/ign-0.1.25-darwin-x64.tar.gz"
      sha256 "2aebf78f160bd991b21e26b99036dcbde1195bfeb57774b56f35925914c5f983"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/ign/releases/download/v0.1.25/ign-0.1.25-linux-arm64.tar.gz"
      sha256 "161416b01af84d2499b375824ff0ff4506d4c5b1f3d1e8524bf2230a11453154"
    else
      url "https://github.com/tacogips/ign/releases/download/v0.1.25/ign-0.1.25-linux-x64.tar.gz"
      sha256 "2b9fd1e6b405b3f9f137b0c240d650baae4b18baa7907131dac9ef51b07efc0f"
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
