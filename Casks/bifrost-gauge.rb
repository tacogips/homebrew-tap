cask "bifrost-gauge" do
  version "0.1.6"
  sha256 "e39a8d9ec9e710330374a01c85ece15bfa9152283bf0ce161606170069446985"

  url "https://github.com/tacogips/homebrew-tap/releases/download/bifrost-gauge-v#{version}/bifrost-gauge_#{version}_aarch64.app.zip"
  name "bifrost-gauge"
  desc "Menu bar app for local Bifrost budget status and controls"
  homepage "https://github.com/tacogips/bifrost-gauge"

  livecheck do
    skip "Release assets are hosted in the shared tap repository"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "bifrost-gauge.app"
  binary "#{appdir}/bifrost-gauge.app/Contents/MacOS/bifrost-gauge", target: "bifrost-gauge"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/bifrost-gauge.app"],
                   sudo: false
  end

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
