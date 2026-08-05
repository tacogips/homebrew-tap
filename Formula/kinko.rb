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
      url "https://github.com/tacogips/kinko/releases/download/v0.1.8/kinko_0.1.8_darwin_arm64.tar.gz"
      sha256 "82793aae92dee6dc6e4c9b032eeaf1331e1067b592ed0a209eaa888ada513f58"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.8/kinko_0.1.8_darwin_amd64.tar.gz"
      sha256 "47967665e45b38aeb9da624af6ca767f8ee9b9267b22282b94d7c933dfa924ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.8/kinko_0.1.8_linux_arm64.tar.gz"
      sha256 "44bc22aedbc1c325fe5eac300965ec695c325582815884ab0190b0498133c954"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.8/kinko_0.1.8_linux_amd64.tar.gz"
      sha256 "bd4b436bc0a3a31fca34dd994b5ad0f725d718361d21775f370fb675d403533f"
    end
  end

  def install
    bin.install Dir["kinko_*"].first => "kinko"
  end

  test do
    assert_equal "0.1.8", shell_output("#{bin}/kinko version").strip
  end
end
