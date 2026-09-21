cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.41"
  sha256 arm:   "2bef957f13c3087fddee2a57bb194f20badbc2042ef41a258b57cdc244639291",
         intel: "eb7e050d9accba4f5a10080efedda3466b0c333250aa04e489baa219828419a7"

  url "https://github.com/tacogips/riela/releases/download/v0.1.41/riela-#{version}-#{arch}.dmg"
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
