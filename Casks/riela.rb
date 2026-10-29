cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.85"
  sha256 "da0a596e675349512de4b6a82fe02732b06894c481438c88560f24d4510426aa"

  url "https://github.com/tacogips/riela/releases/download/v0.2.85/riela-#{version}-#{arch}.dmg"
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
