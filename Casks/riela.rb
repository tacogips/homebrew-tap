cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.33"
  sha256 arm:   "26fb11bc0a0bee4163b9ed7561baa9b4b7eef752c784004aa6ef70b023adfa95",
         intel: "7a735fd9cbcbf609a6a12d54d0ac00a17b16c3772f72db29e8fc927d45634c83"

  url "https://github.com/tacogips/riela/releases/download/v0.1.33/riela-#{version}-#{arch}.dmg"
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
