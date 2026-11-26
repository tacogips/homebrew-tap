cask "riela" do
  arch arm: "darwin-arm64"

  version "0.3.11"
  sha256 "a1a1699c18965d23214f0043a75f31eb29a95f81c09f510af81f7f85118bbe35"

  url "https://github.com/tacogips/riela/releases/download/v0.3.11/riela-#{version}-#{arch}.dmg"
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
