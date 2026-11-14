cask "riela" do
  arch arm: "darwin-arm64"

  version "0.3.9"
  sha256 "882531b70ae8d77b83646fc9a4a567ad50ac1550d9f21d9c1e4f62002fd83078"

  url "https://github.com/tacogips/riela/releases/download/v0.3.9/riela-#{version}-#{arch}.dmg"
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
