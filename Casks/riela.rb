cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.43"
  sha256 "6e90f47d5e8923e3f5afc8ec1f862a7f80f4412da39ffa2b9b43c3a21e72241f"

  url "https://github.com/tacogips/riela/releases/download/v0.1.43/riela-#{version}-#{arch}.dmg"
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
