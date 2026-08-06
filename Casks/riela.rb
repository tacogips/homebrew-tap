cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.23"
  sha256 arm:   "485a222aca5393194a2e0f1aa38fe7d70cd093254d8740b2a1f41f2e059f87b1",
         intel: "0fe04f6e6306ddcd98387b3518e6ee89a1932e8cb76bd3ca7d8bb012ed0865ad"

  url "https://github.com/tacogips/riela/releases/download/v0.1.23/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime with a menu bar app and CLI"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

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
