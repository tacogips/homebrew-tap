cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.11"
  sha256 "d78ef15a22ccd3408b0f2fc54a4fe9530c740a35cb8458a120cdede0c609925e"

  url "https://github.com/tacogips/riela/releases/download/v0.2.11/riela-#{version}-#{arch}.dmg"
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
