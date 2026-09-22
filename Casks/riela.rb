cask "riela" do
  arch arm: "darwin-arm64"

  version "0.1.45"
  sha256 "a7b9b833aec09830d6371ab456f8bbe67f9cb8864042f565ebc3157a439139f3"

  url "https://github.com/tacogips/riela/releases/download/v0.1.45/riela-#{version}-#{arch}.dmg"
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
