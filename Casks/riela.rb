cask "riela" do
  version "0.1.7"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "c838e1703c9ec68d904e25276130b826777da1ad39e48e45e02b2104e314c4aa",
         intel: "c240245bef56a728bf4b5e2244c9abe276345daf040d98baaac6b1d3a347ede9"

  url "https://github.com/tacogips/riela/releases/download/v0.1.7/riela-#{version}-#{arch}.dmg"
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
