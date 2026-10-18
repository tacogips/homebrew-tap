class GmailGatewayThreads < Formula
  desc "Mailbox-mutating Gmail workflow gateway"
  homepage "https://github.com/tacogips/gmail-gateway"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-threads-0.1.21-darwin-arm64.tar.gz"
      sha256 "20d46e548a69827e96be26dfe8899f6871b405e99391b87cadad9602bbc0f41e"
    else
      url "https://github.com/tacogips/gmail-gateway/releases/download/v0.1.21/gmail-gateway-threads-0.1.21-darwin-x64.tar.gz"
      sha256 "34e5fc8671fc5d1d0ca75a653bb8fcd85279b28b40b9b85367d89f6d45e7f722"
    end
  end

  def install
    bin.install "bin/gmail-gateway-threads"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gmail-gateway-threads --help")
  end
end
