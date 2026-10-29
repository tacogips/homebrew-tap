cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.84"
  sha256 "8b4229d1d8de0cdcf1fce7b2d361d14fd841f5a62eb79195ae76b7c2952f1f7b"

  url "https://github.com/tacogips/riela/releases/download/v0.2.84/riela-#{version}-#{arch}.dmg"
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
