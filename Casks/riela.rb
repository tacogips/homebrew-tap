cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.47"
  sha256 "bd887ecde6c90b76956b63219959f3324dce0510369538c85b2703e8550a2632"

  url "https://github.com/tacogips/riela/releases/download/v0.1.47/riela-#{version}-#{arch}.dmg"
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
