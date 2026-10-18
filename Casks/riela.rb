cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.13"
  sha256 "c8b6a9c74b7103c05c40699e387cdad8a57a9dc9af06663334ed508f8db62cd6"

  url "https://github.com/tacogips/riela/releases/download/v0.2.13/riela-#{version}-#{arch}.dmg"
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
