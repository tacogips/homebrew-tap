cask "riela" do
  arch arm: "darwin-arm64"

  version "0.2.78"
  sha256 "73d8eb2dbb7b58ddb0c1ea556a42df8a64407d4718d8d92327d98283065b6114"

  url "https://github.com/tacogips/riela/releases/download/v0.2.78/riela-#{version}-#{arch}.dmg"
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
