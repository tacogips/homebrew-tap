cask "kaiba" do
  version "0.1.12"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "4e684abd293d7ae989b8b422cd99009daeda651d0b08a09ccd5013968b4a5a0d",
         intel: "73862f4ccd6c3d99e4cb7d3aa290de463695d9abe8e587d122d7a2cd989e1017"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.12/kaiba-#{version}-#{arch}.dmg",
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
