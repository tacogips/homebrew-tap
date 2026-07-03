cask "riela" do
  version "0.1.15"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "a00def493e1ab49c80536d04b0510544428e441130987d64ec6493067ca75387",
         intel: "32b17e9f7748f3d73d1beeb99ea88b46f29616534fe65bf56e941c66e61a3e77"

  url "https://github.com/tacogips/riela/releases/download/v0.1.15/riela-#{version}-#{arch}.dmg"
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
