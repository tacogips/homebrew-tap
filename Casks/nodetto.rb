cask "nodetto" do
  version "0.2.5"
  sha256 "94e237dcab1c187b84b77f46d49d8af5a8f27aedda9fe8e3854374afe4d71206"

  url "https://github.com/tacogips/nodetto-app/releases/download/v#{version}/Nodetto_#{version}_aarch64.dmg"
  name "Nodetto"
  desc "Local-only diagram, ERD and design editor"
  homepage "https://github.com/tacogips/nodetto-app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Nodetto.app"
  binary "#{appdir}/Nodetto.app/Contents/MacOS/nodetto-cli"

  zap trash: [
    "~/Library/Application Support/me.tacogips.nodetto",
    "~/Library/Caches/me.tacogips.nodetto",
    "~/Library/WebKit/me.tacogips.nodetto",
  ]

  caveats do
    <<~EOS
      This cask installs the signed and notarized local-only Nodetto.app and links its
      nodetto-cli command (ERD DDL export and checks, canonical formatting and
      validation of nodetto JSONL documents) into the Homebrew prefix.
      Cloud sync and account controls are disabled in this desktop client.
      Open a document from a terminal with: open -a nodetto FILE.jsonl
    EOS
  end
end
