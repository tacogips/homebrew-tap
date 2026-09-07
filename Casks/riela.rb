cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.37"
  sha256 arm:   "56cae5e9658b3ada615c06db02789a1753b443032344ba0c4c06ed5f7885a44e",
         intel: "c1bb9eca7d121c53b8a68ef090df374713c890fef62f461a1421899ddda62899"

  url "https://github.com/tacogips/riela/releases/download/v0.1.37/riela-#{version}-#{arch}.dmg"
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
