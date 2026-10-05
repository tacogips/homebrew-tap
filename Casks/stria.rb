cask "stria" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.1.1"
  sha256 arm:   "725393d5d2e4883a6eec8a7a0a615981b4dde0b3a5941caad951be8b9c719205",
         intel: "333351e60ed6c535c12be201524ee62fe0dd45e3ce180a544c832a4a18631b0a"

  url "https://github.com/tacogips/stria/releases/download/v0.1.1/stria-#{version}-#{arch}.dmg"
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
