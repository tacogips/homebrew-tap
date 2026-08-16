class S3Gateway < Formula
  desc "Bounded SigV4-authenticated S3 gateway for POSIX and upstream S3 storage"
  homepage "https://github.com/tacogips/s3-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/s3-gateway/releases/download/v0.1.0/s3-gateway-0.1.0-darwin-arm64.tar.gz", tag: "v0.1.0"
      sha256 "ccfba2104bcd571df2a0dac7f70497691defe096fda67b15ae3055817c8b3bb1"
    else
      url "https://github.com/tacogips/s3-gateway/releases/download/v0.1.0/s3-gateway-0.1.0-darwin-x64.tar.gz", tag: "v0.1.0"
      sha256 "90b82e6dc9c0de16f542bb1cfe404e856eb40bab6132ab196dc7dda7a25e7ef9"
    end
  end

  def install
    bin.install "bin/s3-gateway"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/s3-gateway --version")
  end
end
