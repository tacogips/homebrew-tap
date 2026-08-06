cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.24"
  sha256 arm:   "d88f182c5327bacd531763d8e6e5b759ac3775e6dc8df3d3a556cceec36044bb",
         intel: "c871522f743b46685a360fe17748f0010757d9b4e2089df492922111fbfe0bff"

  url "https://github.com/tacogips/riela/releases/download/v0.1.24/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime with a menu bar app and CLI"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

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
