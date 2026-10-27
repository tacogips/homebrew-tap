cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.80"
  sha256 "6bc4090b36d6a349a78b277e50915b8213e5d4704930e20e2645cbcb92f574ff"

  url "https://github.com/tacogips/riela/releases/download/v0.2.80/riela-#{version}-#{arch}.dmg"
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
