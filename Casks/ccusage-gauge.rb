cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.8"
  sha256 arm:   "3ce4d9ad2dc173d2a05878fcd876eba7919fa9455dae576e87612943e21cdc14",
         intel: "5ca015ed70038fb45a1ad7328e0776d6df4afb44bac8691be64b0bbcb7d17e03"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.8/ccusage-gauge_#{version}_#{arch}.app.zip"
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
