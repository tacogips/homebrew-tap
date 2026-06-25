class Kinko < Formula
  desc "Encrypted environment variable manager for repository and shared scopes"
  homepage "https://github.com/tacogips/kinko"
  version "0.1.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.6/kinko_0.1.6_darwin_arm64.tar.gz"
      sha256 "9b06be8ad37260fd94da42bef8c3e76b6479a191c2d7cf9698e407698b2b59bc"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.6/kinko_0.1.6_darwin_amd64.tar.gz"
      sha256 "08223e525e62ed2dd680912edfa510b80a166d3f1d07cb56e1044a57efad4394"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.6/kinko_0.1.6_linux_arm64.tar.gz"
      sha256 "80f366a8dfe04db64436f70762b2ffd2c50da933393353043e192e98f89cecfb"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.6/kinko_0.1.6_linux_amd64.tar.gz"
      sha256 "c47dbdc0f51235a6544d01866e3e3613d8df4ffc7b663668054460bcc72ec8dd"
    end
  end

  def install
    bin.install Dir["kinko_*"].first => "kinko"
  end

  test do
    assert_equal "0.1.6", shell_output("#{bin}/kinko version").strip
  end
end
