cask "riela" do
  version "0.1.22"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "7121bb275f7a144c464d1bc9cf4d4abc0d00cfad88429f5de99ea713e2ba8324",
         intel: "eca801e1b9e9885a2a6ab125e9651ffe6dc75715ef09665d6c47a07719f5682b"

  url "https://github.com/tacogips/riela/releases/download/v0.1.22/riela-#{version}-#{arch}.dmg"
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
