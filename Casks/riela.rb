cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.14"
  sha256 "711775d464f14d7646a2ee5a21a300a1e037e80904bb9d2e115b4b93cb5e09af"

  url "https://github.com/tacogips/riela/releases/download/v0.2.14/riela-#{version}-#{arch}.dmg"
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
