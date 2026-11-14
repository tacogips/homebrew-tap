cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.18"
  sha256 arm:   "c282c0f91355b62eefcc598ca3fa7d5e7e889ec988f7fd88ed87bd01b46d285b",
         intel: "d9c0e3330c738ccfb6e36ebbc93ba52edaf66e4a32840c8e4838425cf0d40096"

  url "https://github.com/tacogips/riela/releases/download/v0.1.18/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime with menu bar app and CLI"
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
