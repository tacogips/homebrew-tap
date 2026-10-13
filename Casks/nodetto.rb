cask "nodetto" do
  version "0.2.4"
  sha256 "84d2bf7d17daaf88e29ecd5276a762e87512adbf0e1234ef6bade069d392ce2e"

  url "https://github.com/tacogips/nodetto-app/releases/download/v#{version}/Nodetto_#{version}_aarch64.dmg"
  name "Nodetto"
  desc "Diagram, ERD and design editor with a semantic JSONL file format"
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
      This cask installs the signed and notarized Nodetto.app and links its
      nodetto-cli command (ERD DDL export and checks, canonical formatting and
      validation of nodetto JSONL documents) into the Homebrew prefix.
      Open a document from a terminal with: open -a nodetto FILE.jsonl
    EOS
  end
end
