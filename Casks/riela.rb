cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.44"
  sha256 "600c8b3c9eb2ec679a4a0215bc7bde122bfa593da549b74045106a0da0761667"

  url "https://github.com/tacogips/riela/releases/download/v0.1.44/riela-#{version}-#{arch}.dmg"
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
