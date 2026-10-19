cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.25"
  sha256 "da8a025ac12ab03c959d0e0ec6361288fa31272199db4a5771f05d93573d6ee8"

  url "https://github.com/tacogips/riela/releases/download/v0.2.25/riela-#{version}-#{arch}.dmg"
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
