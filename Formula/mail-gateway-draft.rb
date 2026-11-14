class MailGatewayDraft < Formula
  desc "Draft-writing Gmail workflow gateway"
  homepage "https://github.com/tacogips/mail-gateway"
  version "0.1.6"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.6/mail-gateway-draft-0.1.6-darwin-arm64.tar.gz"
      sha256 "238e3966dae121c601cb63cb61fa572610fa40a0290d480c7f8aede2045aadf8"
    else
      url "https://github.com/tacogips/mail-gateway/releases/download/v0.1.6/mail-gateway-draft-0.1.6-darwin-x64.tar.gz"
      sha256 "94767ef6d37e71f87ff4c56659cee5d3efa8c65d76e3bb70b52d12d58c9f09c6"
    end
  end

  def install
    bin.install "bin/mail-gateway-draft"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/mail-gateway-draft --help")
  end
end
