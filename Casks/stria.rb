cask "stria" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.0"
  sha256 arm:   "6367cc108f4a461bbe55ff7fe63759dfdb7aa5e14f5051e4c6cddc8c970b04ba",
         intel: "e8119680add1013db56d2111b00afbfba4eca20ffe204cb00839e6c3c8a5a834"

  url "https://github.com/tacogips/stria/releases/download/v0.1.0/stria-#{version}-#{arch}.dmg",
      verified: "github.com/tacogips/stria/releases/download/"
  name "Stria"
  desc "PDF reader with OCR-indexed page search and an AI agent pane"
  homepage "https://github.com/tacogips/stria"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Stria.app"
  binary "#{appdir}/Stria.app/Contents/MacOS/stria"

  zap trash: "~/.local/stria"

  caveats do
    <<~EOS
      This cask installs the signed and notarized Stria.app and links its
      stria command line tool (an OCR search and page-image tool for AI
      agents) into the Homebrew prefix. Library data lives in ~/.local/stria
      (override with STRIA_HOME). Choose an OCR vendor in Settings
      (Agent > Settings...) before the first OCR run.
    EOS
  end
end
