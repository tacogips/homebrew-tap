cask "diagra" do
  version "0.2.0"
  sha256 "9c59ed2b6c9c7fec105059e8bcebf6fb4232877768a0b5ad7b5e90a7e9a10b64"

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
