cask "kaiba" do
  version "0.1.9"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "8ac7b0f8431e94282023dcacc21d9a06f69be5edb9b80966273c6b0b9d32a5af",
         intel: "91d7a2901df2bf4ea0f8c18b3ff3476735a0daa37708dcc9f47c7b55d3d39c45"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.9/kaiba-#{version}-#{arch}.dmg",
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
