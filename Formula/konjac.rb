class Konjac < Formula
  desc "OCR memo CLI for captured multilingual text"
  homepage "https://github.com/tacogips/konjac"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/konjac/releases/download/v0.1.3/konjac-0.1.3-darwin-arm64.tar.gz"
      sha256 "e7372bd7b95a61199dc8611cbd0cb255c15f3aa23e11a52e000a3e137b61bfc6"
    else
      url "https://github.com/tacogips/konjac/releases/download/v0.1.3/konjac-0.1.3-darwin-x64.tar.gz"
      sha256 "066b4b5ba838c4e98ba08e3d942f64338cac38aa6773017fb75ab971b7c80388"
    end
  end

  def install
    bin.install "bin/konjac"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/konjac --version")
  end
end
