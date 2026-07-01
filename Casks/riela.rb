cask "riela" do
  version "0.1.13"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "b4338b83233db8241dd958ae3388fe53cc29e2b8defa3f7b27a54bfc48b44ea1",
         intel: "3c93434694ef03f023ba28e1108b5e74b3f56bb4f2bcc8fc9d691e014a11a307"

  url "https://github.com/tacogips/riela/releases/download/v0.1.13/riela-#{version}-#{arch}.dmg"
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
