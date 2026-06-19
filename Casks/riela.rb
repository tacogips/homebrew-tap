cask "riela" do
  version "0.1.1"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "57ff9c67cf0e595f121b8465d5525cadcde15344c245ea80b46e5c4464269eff",
         intel: "a2b6fce5fd08ac46ede32085b38e8df0a5532767d9522abdcf57e375f5f753f2"

  url "https://github.com/tacogips/riela/releases/download/v0.1.1/riela-#{version}-#{arch}.dmg",
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
