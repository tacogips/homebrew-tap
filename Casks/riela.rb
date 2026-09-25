cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.55"
  sha256 "3436797b73264222e05aa69e6719fc7c1b5e7ca1192ac919b31b38a36f1dc280"

  url "https://github.com/tacogips/riela/releases/download/v0.1.55/riela-#{version}-#{arch}.dmg"
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
