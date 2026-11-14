cask "kaiba" do
  version "0.1.17"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "8b5bf4ecca6c7baa534dc0714af5c55e2403ddae39102637a92ca44329e9de0a",
         intel: "360b516a86af0dda3fc2433bedf330ec00a72dc54d553aa606b865aec5d84185"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.17/kaiba-#{version}-#{arch}.dmg"
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
