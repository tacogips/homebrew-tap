cask "bifrost-gage" do
  version "0.1.1"
  sha256 "1afad9fe8fa3ee10ba2b3ec73adb1e1d4267ca189e880258ddda00c184d09c09"

  url "https://github.com/tacogips/homebrew-tap/releases/download/bifrost-gage-v#{version}/bifrost-gage_#{version}_aarch64.app.zip"
  name "bifrost-gage"
  desc "Menu bar app for local Bifrost budget status and controls"
  homepage "https://github.com/tacogips/bifrost-gage"

  livecheck do
    skip "Release assets are hosted in the shared tap repository"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "bifrost-gage.app"
  binary "#{appdir}/bifrost-gage.app/Contents/MacOS/bifrost-gage", target: "bifrost-gage"

  caveats do
    <<~EOS
      bifrost-gage connects to an already-running Bifrost server. Configure the
      Bifrost URL and Virtual Key from the menu bar app, or edit:

        ~/.config/bifrost-gage/bifrost-gage-config.json

      This cask installs the current Apple Silicon app zip release artifact.
      The app is signed and notarized with Developer ID.
    EOS
  end
end
