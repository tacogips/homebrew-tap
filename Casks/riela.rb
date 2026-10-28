cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.83"
  sha256 "b4721913772177ed9322b6a922462cff0ec2ecd9d91086e52abde8b49373278d"

  url "https://github.com/tacogips/riela/releases/download/v0.2.83/riela-#{version}-#{arch}.dmg"
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
