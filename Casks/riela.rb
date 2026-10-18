cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.12"
  sha256 "c1b9beff428bf3b57b87ee03b860d2583e7b5f67d8a3e5bfcd307d0133938fe1"

  url "https://github.com/tacogips/riela/releases/download/v0.2.12/riela-#{version}-#{arch}.dmg"
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
