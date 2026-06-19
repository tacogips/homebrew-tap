cask "riela" do
  version "0.1.2"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "af15d435e488703e94d4f48618fa985642990eb90fa0487cd3a5dee2e357929e",
         intel: "f99b324e5bd356d9d04c0fd4a6b941e83f5c5bfb8cd4de96aac38e482e4536ee"

  url "https://github.com/tacogips/riela/releases/download/v0.1.2/riela-#{version}-#{arch}.dmg",
      verified: "github.com/tacogips/riela/releases/download/"
  name "riela"
  desc "Swift-native workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "riela"

  caveats do
    <<~EOS
      This cask installs the signed and notarized macOS command line tool.
      Homebrew links riela into the native Homebrew prefix for this Mac.
    EOS
  end
end
