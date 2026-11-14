cask "riela" do
  version "0.1.21"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "51ee3b92622de72bf0d891b3c0f03c844a00212dc15e813ad85bcde6b066410e",
         intel: "8ef7a703b31aa2ead51888ea146ecaf5fab3e2e90f86e55637618a26d9b1437d"

  url "https://github.com/tacogips/riela/releases/download/v0.1.21/riela-#{version}-#{arch}.dmg"
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
