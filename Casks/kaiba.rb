cask "kaiba" do
  version "0.1.7"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "ed42910d184e28ec4c25e2dbae0dbd4490359105ffed07cb045449616a6255f6",
         intel: "0d1c47401d9dc7680862ed1944b4db8587f2b6f7537cd02883b8289779200bf7"

  url "https://github.com/tacogips/kaiba/releases/download/v0.1.7/kaiba-#{version}-#{arch}.dmg",
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
