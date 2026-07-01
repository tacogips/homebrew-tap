cask "riela" do
  version "0.1.14"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "ebe470b557e539f780ee8e98e4458a79617fbb09077c0ef53a6be9bba602402a",
         intel: "7563e2279d9df84805f9244a6d9d4141c87547e4621d7d004a93c8c28776a8c1"

  url "https://github.com/tacogips/riela/releases/download/v0.1.14/riela-#{version}-#{arch}.dmg"
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
