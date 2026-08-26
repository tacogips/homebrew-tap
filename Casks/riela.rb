cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.32"
  sha256 arm:   "7ecca1db03407b6fbef58ff40800073e4caf4cedaf1de88825b498492abf8ce8",
         intel: "607e9cb1db4528c1aa062649d452e00b030276353624c3088592345b447338a8"

  url "https://github.com/tacogips/riela/releases/download/v0.1.32/riela-#{version}-#{arch}.dmg"
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
