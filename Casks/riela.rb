cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.0"
  sha256 "fc8941d8a8daf385976ddc3caf3af57d472812b6d6b407f8127a634c8c5cf1ad"

  url "https://github.com/tacogips/riela/releases/download/v0.2.0/riela-#{version}-#{arch}.dmg"
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
