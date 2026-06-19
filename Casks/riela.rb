cask "riela" do
  version "0.1.2"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "980d354c6f17ed9adbe6ddae4fbd7de64330394ab27058705f390f1bb143b1bb",
         intel: "0aac75554aed557262ee2dbc87506ae8b66e84176b949f801e0e409d3ec20d33"

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
