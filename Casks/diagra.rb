cask "diagra" do
  version "0.1.0"
  sha256 "d83ae57875ae5fa2b25e9cbbc9ba50595d11a4b482cdbcbb237bbdd5c1565148"

  url "https://github.com/tacogips/diagra-app/releases/download/v#{version}/diagra_#{version}_aarch64.dmg"
  name "diagra"
  desc "Diagram, ERD and design editor with a semantic JSONL file format"
  homepage "https://github.com/tacogips/diagra-app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "diagra.app"
  binary "#{appdir}/diagra.app/Contents/MacOS/diagra-cli"

  zap trash: [
    "~/Library/Application Support/me.tacogips.diagra",
    "~/Library/Caches/me.tacogips.diagra",
    "~/Library/WebKit/me.tacogips.diagra",
  ]

  caveats do
    <<~EOS
      This cask installs the signed and notarized diagra.app and links its
      diagra-cli command (ERD DDL export and checks, canonical formatting and
      validation of diagra JSONL documents) into the Homebrew prefix.
      Open a document from a terminal with: open -a diagra FILE.jsonl
    EOS
  end
end
