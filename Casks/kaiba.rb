cask "kaiba" do
  version "0.1.15"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "0af5cca7e63a9adda429c61251296f1f653433b14830c7956393da5b5e28b451",
         intel: "16450a9ea7ae3a1ea774500a70c11963711f43e893bd47e4a2d5da21b7fcab00"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.15/kaiba-#{version}-#{arch}.dmg"
  name "kaiba"
  desc "System-memory service for AI agents"
  homepage "https://github.com/tacogips/kaiba"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Kaiba.app"
  binary "kaiba"

  caveats do
    <<~EOS
      This cask installs the signed and notarized Kaiba.app (a resident menu-bar
      app that runs the note server) and the kaiba command line tool.
      Launch Kaiba from Applications to keep the server running in the menu bar,
      or run 'kaiba serve' from the CLI. Homebrew links kaiba into the
      native Homebrew prefix for this Mac.
    EOS
  end
end
