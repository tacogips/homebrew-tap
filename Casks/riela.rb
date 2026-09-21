cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.39"
  sha256 arm:   "7fd063cbeb764925623b10779f47d1165fc8c8c0b30f2cfc01ead0ff3c61779b",
         intel: "2b13c8c4a8f672c2efaf972517a6be8b3bed56591947c4e63a55f390abc7b336"

  url "https://github.com/tacogips/riela/releases/download/v0.1.39/riela-#{version}-#{arch}.dmg"
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
