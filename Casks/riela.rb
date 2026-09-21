cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.40"
  sha256 arm:   "c5ec424daff3f18e0d66508600e42d986827376c65e24b452dbd906aea276b2b",
         intel: "7caf8323bcb13bad4aa62bae554cd0084cf3200118a9d761f9e1a70cb42f753f"

  url "https://github.com/tacogips/riela/releases/download/v0.1.40/riela-#{version}-#{arch}.dmg"
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
