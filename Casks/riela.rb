cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.27"
  sha256 arm:   "b361020ea737eb62ef238092dd6b9c197024d919f577315135892a2077fc0303",
         intel: "5d897ccb12e23903b2e57525b830112d46196595bd376bbc07116d298c732d6e"

  url "https://github.com/tacogips/riela/releases/download/v0.1.27/riela-#{version}-#{arch}.dmg"
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
