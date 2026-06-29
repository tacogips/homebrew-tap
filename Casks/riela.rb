cask "riela" do
  version "0.1.10"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "a1a6cc3c08d7df2233a45f2948a0e3a411b4af6eef9ceb8dfeadfe02bf8680c6",
         intel: "979acd96cead98793ec6758621db9dc17d1dbe6ddec7b71123f8268a964e028a"

  url "https://github.com/tacogips/riela/releases/download/v0.1.10/riela-#{version}-#{arch}.dmg"
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
