cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.38"
  sha256 arm:   "d22c5686456ed28ea7edc7ca3cb099c4e0e93c0d3bfcef1ce7afd12c4fe46a48",
         intel: "b9c75045a78136e14443461497f26f736e390f2f458e98dfb41fe9f514873728"

  url "https://github.com/tacogips/riela/releases/download/v0.1.38/riela-#{version}-#{arch}.dmg"
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
