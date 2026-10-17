cask "nodetto" do
  version "0.4.0"
  sha256 "a69930a42447c636a908417fc8e85f080c6774896b8932d10d1ffc9670fed473"

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
      native Rust nodetto-cli command (AI drawing, image and schema export, formatting and
      validation of nodetto JSONL documents) into the Homebrew prefix.
      Cloud sync and account controls are disabled in this desktop client.
      Open a document from a terminal with: nodetto-cli open FILE.jsonl
      Start the MCP server with: nodetto-cli mcp
      No Node.js or Bun installation is required.
    EOS
  end
end
