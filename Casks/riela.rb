cask "riela" do
  version "0.1.8"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "64dc3bc60cf8988a7af7ece17c83f80b7f416d56e1371edf2b461d3ec00392cf",
         intel: "d24824c6378d07d59277e8f0d07204d9f798dee59bc41afc43b66b0a1b2cffd3"

  url "https://github.com/tacogips/riela/releases/download/v0.1.8/riela-#{version}-#{arch}.dmg"
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
