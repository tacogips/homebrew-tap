cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.1"
  sha256 "ad0a350f473461cacb095d0ca93f43844887d7d3c96ae5f48fe8e0f9821f0853"

  url "https://github.com/tacogips/riela/releases/download/v0.2.1/riela-#{version}-#{arch}.dmg"
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
