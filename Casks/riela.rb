cask "riela" do
  version "0.1.9"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "b71d9b117e89889114baf394eaacacb1eb72f98d9a08cd2808349766772b86f4",
         intel: "7a7ff3dcb471029a47a2043d93e5b656cc14dd32fb1217f32287651942cd03d4"

  url "https://github.com/tacogips/riela/releases/download/v0.1.9/riela-#{version}-#{arch}.dmg"
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
