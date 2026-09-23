cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.50"
  sha256 "38523307bc2656dd5b873f89ea375614d94baa5a157226b163f232ea1afb9a69"

  url "https://github.com/tacogips/riela/releases/download/v0.1.50/riela-#{version}-#{arch}.dmg"
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
