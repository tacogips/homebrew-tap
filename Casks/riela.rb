cask "riela" do
  arch arm: "darwin-arm64"

  version "0.3.13"
  sha256 "4d413cf93fc90208f821bf90a34d3eabe9b11b6ef44f090b20c35967f67a482a"

  url "https://github.com/tacogips/riela/releases/download/v0.3.13/riela-#{version}-#{arch}.dmg"
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
