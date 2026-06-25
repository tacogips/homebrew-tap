class Kinko < Formula
  desc "Encrypted environment variable manager for repository and shared scopes"
  homepage "https://github.com/tacogips/kinko"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.5/kinko_0.1.5_darwin_arm64.tar.gz"
      sha256 "b71d36a50f15e4924e2c1ee85cef2fb6609c84a15ed414d289b7297d46615213"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.5/kinko_0.1.5_darwin_amd64.tar.gz"
      sha256 "02b65adb5381c508bb519b0100bd8775b2b98277df001275df989421b8c32286"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/kinko/releases/download/v0.1.5/kinko_0.1.5_linux_arm64.tar.gz"
      sha256 "8b857559deb066bcbd99c05625d8379fc2ed955aec8acf4d9f85e8f4edf76ecc"
    else
      url "https://github.com/tacogips/kinko/releases/download/v0.1.5/kinko_0.1.5_linux_amd64.tar.gz"
      sha256 "005ffe43bd70d32d741137c09a9721e9befc57d3ee99e7cd8b3c79e3658a5c8f"
    end
  end

  def install
    bin.install Dir["kinko_*"].first => "kinko"
  end

  test do
    assert_equal "0.1.5", shell_output("#{bin}/kinko version").strip
  end
end
