cask "diagra" do
  version "0.2.2"
  sha256 "db343709569ab72b78c51e6721f3ef2ee3da2fd10b6ae5da8199b22c384399d9"

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
