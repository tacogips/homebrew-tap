cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.81"
  sha256 "81c31a280a5ffd2ce6acd4e90efefa8c5c69b5aa425ee48daf8158618418dec7"

  url "https://github.com/tacogips/riela/releases/download/v0.2.81/riela-#{version}-#{arch}.dmg"
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
