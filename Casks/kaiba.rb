cask "kaiba" do
  version "0.1.16"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "2c822159258f9217f0bbec124787cc981ea09e68704a735ceaeb49cdee18f73d",
         intel: "af38bcaba348e00fd1b4095a09a788c327e0b8e70543cf67779cd27e37493c1b"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.16/kaiba-#{version}-#{arch}.dmg"
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
