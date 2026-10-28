cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.82"
  sha256 "bd6b37040a5bc1a055e3db57858cb85d508877e87d7349a870e1fc3798e045c4"

  url "https://github.com/tacogips/riela/releases/download/v0.2.82/riela-#{version}-#{arch}.dmg"
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
