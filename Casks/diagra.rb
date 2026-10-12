cask "diagra" do
  version "0.2.1"
  sha256 "58f227c72d1c9e513ce0cc023030472785e26f4cf7c93c184d9105dd13669ee0"

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
