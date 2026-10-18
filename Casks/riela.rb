cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.7"
  sha256 "f0a8dd5638b20ca584dfb89a6232b2d84d25a5d5b7510ab75d1940a67f2eab0c"

  url "https://github.com/tacogips/riela/releases/download/v0.2.7/riela-#{version}-#{arch}.dmg"
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
