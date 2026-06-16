cask "bifrost-gauge" do
  version "0.1.3"
  sha256 "dc0e7fe6ac21d261a791258bd144a3c0ffdd3379686fcc1eb2d4f3fc32a4c9f6"

  url "https://github.com/tacogips/homebrew-tap/releases/download/bifrost-gauge-v#{version}/bifrost-gauge_#{version}_aarch64.app.zip"
  name "bifrost-gauge"
  desc "Menu bar app for local Bifrost budget status and controls"
  homepage "https://github.com/tacogips/ai-budget-manager"

  livecheck do
    skip "Release assets are hosted in the shared tap repository"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "bifrost-gauge.app"
  binary "#{appdir}/bifrost-gauge.app/Contents/MacOS/bifrost-gauge", target: "bifrost-gauge"

  caveats do
    <<~EOS
      bifrost-gauge connects to an already-running Bifrost server. Configure the
      Bifrost URL and Virtual Key from the menu bar app, or edit:

        ~/.config/bifrost-gauge/bifrost-gauge-config.json

      This cask installs the current Apple Silicon app zip release artifact.
      The app is signed and notarized with Developer ID.
    EOS
  end
end
