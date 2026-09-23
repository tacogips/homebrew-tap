cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.49"
  sha256 "b643ed4bcd4d9e2436fc0e5821682c338a877e48c18615624770d0a348134e3a"

  url "https://github.com/tacogips/riela/releases/download/v0.1.49/riela-#{version}-#{arch}.dmg"
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
