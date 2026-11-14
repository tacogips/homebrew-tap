cask "kaiba" do
  version "0.1.19"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "68cdfaaa88aa905c1b46f9a456bcc76bad3bb8abb56d39bad449cdc1e26708c6",
         intel: "4d370e029afb3410b9d3142d753fcc7fa3d1542dadbf0f1958a48e8dd807d772"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.19/kaiba-#{version}-#{arch}.dmg"
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
