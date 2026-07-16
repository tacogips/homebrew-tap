cask "riela" do
  version "0.1.19"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "217e9ed2149718ae218d1ef4cfbb2c344ef4ea0bbdb1ca6dcc449d31d0fc81eb",
         intel: "f2a0db27eebf0ea7a329e8835a3c1a8da0cef7cc68b8f8a6e634e4f372e5eeec"

  url "https://github.com/tacogips/riela/releases/download/v0.1.19/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime with the macOS menu bar app and CLI"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

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
