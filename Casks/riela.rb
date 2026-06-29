cask "riela" do
  version "0.1.11"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "22ff3dba741d651d8902526d2c245886e98e70c6ab37732b8797cf4b9454bac2",
         intel: "07ec9031bb58b6ddbdeadb3189c4be13fdb2895155b52042c8436909b5af1c41"

  url "https://github.com/tacogips/riela/releases/download/v0.1.11/riela-#{version}-#{arch}.dmg"
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
