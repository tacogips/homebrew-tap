cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.13"
  sha256 arm:   "fc6dafe0a782113a591c6f73bce47b8e13e03e5cc73a9d056ca9e2ea83405b12",
         intel: "9527dc28a1e3729a5225a76e282f8f17f584d866563bf8b634dd5eb4c985c645"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.13/ccusage-gauge_#{version}_#{arch}.app.zip"
  name "CCUsage Gauge"
  desc "Menu bar gauge and local dashboard for AI coding-agent usage costs"
  homepage "https://github.com/tacogips/ccusage-gauge"

  livecheck do
    skip "Release assets are hosted in the shared tap repository"
  end

  depends_on macos: :sonoma

  app "CCUsageGauge.app"
  binary "#{appdir}/CCUsageGauge.app/Contents/MacOS/ccusage-gauge", target: "ccusage-gauge"

  caveats do
    <<~EOS
      CCUsage Gauge reads usage data from the ccusage command. Install ccusage
      separately and configure an absolute path when it is not discoverable on PATH:

        ~/.config/ccusage-gauge/ccusage-config.json

      The app is signed and notarized with Apple Developer ID.
    EOS
  end
end
