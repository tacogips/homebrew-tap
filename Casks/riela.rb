cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.48"
  sha256 "30891d7bd9c5dd8cfb5cb4bfc2108ac7dab3265d1b44021e825c24d9018275c4"

  url "https://github.com/tacogips/riela/releases/download/v0.1.48/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime with a menu bar app and CLI"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "RielaApp.app"
  binary "riela"

  caveats do
    <<~EOS
      This cask installs RielaApp.app and links riela into the native Homebrew prefix for this Mac.
      For the command line tool only, install the formula instead:
        brew install riela
    EOS
  end
end
