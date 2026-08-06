cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.25"
  sha256 arm:   "051ee3d837d97dcb0459de1e2fd6f6238de1420c58f1015383bc17c068a7cbfa",
         intel: "b823144177666b3f397aaf25708c4cf7923a948e3bfcdb830127d936eec6692d"

  url "https://github.com/tacogips/riela/releases/download/v0.1.25/riela-#{version}-#{arch}.dmg"
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
