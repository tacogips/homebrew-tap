cask "riela" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.29"
  sha256 arm:   "aee36d82da44a75c9ef4efb39e410e26c57154b987b9411044f110f4f483b89b",
         intel: "f6a3cd49e3f683b3bee579481439ff20c7bc6f0e56640ed6558a137b574aed16"

  url "https://github.com/tacogips/riela/releases/download/v0.1.29/riela-#{version}-#{arch}.dmg"
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
