cask "kaiba" do
  version "0.1.11"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "f2177a77fb11e5716d76620b98451dcbfea2ff4676ce81ba03fafd719e370743",
         intel: "81dd8349ecbac0aa255f9628e06ff12197217cbfeaf43835652cc568e11589bc"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.11/kaiba-#{version}-#{arch}.dmg",
      verified: "github.com/tacogips/kaiba/releases/download/"
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
