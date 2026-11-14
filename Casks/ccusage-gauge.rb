cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.19"
  sha256 arm:   "a7d76cccea42ea60ec7a71060aab80846b3d29217600379a81894278b14c8f65",
         intel: "224152c137d0c014ffa67add3c9998e77e9220c268d2dda92bb6171a3355e4dc"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.19/ccusage-gauge_#{version}_#{arch}.app.zip"
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
