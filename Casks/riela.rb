cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.15"
  sha256 "4d37ed4ce3e57ad6c6fd8ca4134d02c7cb8391a80c3820f6208cc2022b499f48"

  url "https://github.com/tacogips/riela/releases/download/v0.2.15/riela-#{version}-#{arch}.dmg"
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
