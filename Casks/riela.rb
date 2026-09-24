cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.53"
  sha256 "e0d3e0a1d2ae46b8bf9affc43c10dd2c0afab8c1c2a609ab73645518e39dba4d"

  url "https://github.com/tacogips/riela/releases/download/v0.1.53/riela-#{version}-#{arch}.dmg"
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
