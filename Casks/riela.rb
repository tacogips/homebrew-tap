cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.34"
  sha256 arm:   "9c27ea3c8619f20c2d0733130eeafc0094ebdd1efde900b7c386283c13e77dd8",
         intel: "a085448d20e5116ee1180f71453b342aed058a2669d037bbad36e08c7659257c"

  url "https://github.com/tacogips/riela/releases/download/v0.1.34/riela-#{version}-#{arch}.dmg"
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
