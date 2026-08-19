cask "kaiba" do
  version "0.1.8"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "fa45b1c0ff43e23dc7e8255c24dd87dfb339ec44a5a5ee9eed090a74e6835292",
         intel: "0809ebc190b06fd43d95b48465d41a3848eb44509a80cde7ea11babf97873d95"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.8/kaiba-#{version}-#{arch}.dmg",
      verified: "github.com/tacogips/kaiba/releases/download/"
  name "kaiba"
  desc "System-memory service for AI agents"
  homepage "https://github.com/tacogips/kaiba"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "kaiba"

  caveats do
    <<~EOS
      This cask installs the signed and notarized macOS command line tool.
      Homebrew links kaiba into the native Homebrew prefix for this Mac.
    EOS
  end
end
