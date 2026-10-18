cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.20"
  sha256 "00835af9bc954b0b906914f829b7d6425600734881e698d8ed69bd398af2bf27"

  url "https://github.com/tacogips/riela/releases/download/v0.2.20/riela-#{version}-#{arch}.dmg"
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
