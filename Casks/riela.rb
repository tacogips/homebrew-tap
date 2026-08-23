cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.31"
  sha256 arm:   "a45b1defb0cab87160816b29b5beb7fe9fc69aacbf807c9fcfd78dbd736f25d4",
         intel: "1ce6d4f0edf70ad58c985e3a9e200d5b6a2670f91fdc9c27e4525eeeaf37ace9"

  url "https://github.com/tacogips/riela/releases/download/v0.1.31/riela-#{version}-#{arch}.dmg"
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
