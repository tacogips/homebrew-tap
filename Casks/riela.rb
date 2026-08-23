cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.30"
  sha256 arm:   "4fe265f73d9db1fa8bdd262eff7fdd739a05cbbb9991f9db5867473400ddb4af",
         intel: "83b24a3737b22bad59dba2fb78f3520ecbd5fddde18dd2d2e4dfc896c0e86179"

  url "https://github.com/tacogips/riela/releases/download/v0.1.30/riela-#{version}-#{arch}.dmg"
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
