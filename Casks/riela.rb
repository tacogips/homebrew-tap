cask "riela" do
  arch arm: "darwin-arm64"

  version "0.3.12"
  sha256 "558c3d3291333a6f3d07a759cfcd0ba006a583f1f7f090f8a975367581941c15"

  url "https://github.com/tacogips/riela/releases/download/v0.3.12/riela-#{version}-#{arch}.dmg"
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
