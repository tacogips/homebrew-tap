cask "riela" do
  version "0.1.17"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "1c6a26b852931d40b2899b2df39af977ddd268ed6fcd6a2aefaa2133d51c117d",
         intel: "7a3ddd43d1f3733ea3e7e45121bf7f4e5c23e2ed5ad5ec11dc6987aa14b12f99"

  url "https://github.com/tacogips/riela/releases/download/v0.1.17/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime with the macOS menu bar app and CLI"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

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
