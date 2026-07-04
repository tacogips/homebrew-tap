cask "riela" do
  version "0.1.16"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "f0a688702123125507353da8ca74c5521773b4b8ac421e46014c11080e34ec6f",
         intel: "ab896960df12072854a4c8b9f541ba98b873837814fd7cd64b3a658d25dc80c2"

  url "https://github.com/tacogips/riela/releases/download/v0.1.16/riela-#{version}-#{arch}.dmg"
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
