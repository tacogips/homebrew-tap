cask "riela" do
  version "0.1.20"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "a681526a67f66bb1f9d4fea508e6ac23f37090daa76e0352c6fe4aacece134f1",
         intel: "90d61444346124f682a8156230c880855cbeed6c74564f90e50beaf6c7d86447"

  url "https://github.com/tacogips/riela/releases/download/v0.1.20/riela-#{version}-#{arch}.dmg"
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
