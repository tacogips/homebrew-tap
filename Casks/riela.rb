cask "riela" do
  version "0.1.0"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "f4931dff6a1c9d46fd85799e0efded4eb9d61fa0412e8b328ec2c00f1f4a6f35",
         intel: "32a33cf0fdd1c7a1cb02b82ce47b39f5aea78cc3546db243cd65a55aa39331db"

  url "https://github.com/tacogips/riela/releases/download/v0.1.0/riela-#{version}-#{arch}.dmg",
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
