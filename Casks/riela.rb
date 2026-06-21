cask "riela" do
  version "0.1.5"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "2a5244d51be006a1774a887157a6adc9c036d8c01a377e69c9470403094b5677",
         intel: "82a71dd83a5e11ae6523cbec4faa4f421b8a45e672702dbdbc9ae2482943e59b"

  url "https://github.com/tacogips/riela/releases/download/v0.1.5/riela-#{version}-#{arch}.dmg"
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
