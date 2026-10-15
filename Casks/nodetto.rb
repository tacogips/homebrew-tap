cask "nodetto" do
  version "0.2.8"
  sha256 "4955b55bb6af7dabc29fec2c8218a3ace5274d084c277b48eedba58c4a1ec2a2"

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
