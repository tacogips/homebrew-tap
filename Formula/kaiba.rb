class Kaiba < Formula
  desc "System-memory service for AI agents"
  homepage "https://github.com/tacogips/kaiba"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.16/kaiba-0.1.16-darwin-arm64.tar.gz"
      sha256 "4109793b37c20328aeedefdbe257effaf0843b34fbf82428aa7b168aed8a3912"
    else
      url "https://github.com/tacogips/kaiba/releases/download/v0.1.16/kaiba-0.1.16-darwin-x64.tar.gz"
      sha256 "78abb2a1c2968feeb0c0b613aa720b9d9080b4c47154fefdddcb0adbb0290c72"
    end
  end

  def install
    bin.install "bin/kaiba"
  end

  test do
    assert_match "0.1.16", shell_output("#{bin}/kaiba --version")
  end
end
