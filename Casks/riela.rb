cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.3"
  sha256 "19acffdfe2d82bea4659eaad4eb86f73b2479b6e71cdca958d86a67f78c8fbb1"

  url "https://github.com/tacogips/riela/releases/download/v0.2.3/riela-#{version}-#{arch}.dmg"
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
