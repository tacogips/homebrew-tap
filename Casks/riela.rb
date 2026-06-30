cask "riela" do
  version "0.1.12"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "f1a1b9d1ce0dc2cefb7967576891023319f6b8b99d8f86e7f3f7881c20e86a1f",
         intel: "d96809b907a561c0844aac8259489dbfd95ab866208991843193c6ad8c9ac7c1"

  url "https://github.com/tacogips/riela/releases/download/v0.1.12/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime with the macOS menu bar app and CLI"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

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
