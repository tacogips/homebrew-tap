cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.26"
  sha256 arm:   "1639117c1d1d987faffe7f9805a2ce8e0be0f6342d177cada300d79b27147a05",
         intel: "594a56cd6c59473a905ff5184a5fe7aa9d9dfc0c403820170f5c85aecacac50f"

  url "https://github.com/tacogips/riela/releases/download/v0.1.26/riela-#{version}-#{arch}.dmg"
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
