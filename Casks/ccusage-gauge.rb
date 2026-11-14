cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.12"
  sha256 arm:   "103672e83dc944674eee2e1ccecfd1691ee822b4b4acce22094a164c946c2af9",
         intel: "75497cfcdb2ca348f6b18e31f85940fcfb5fa26a13384c3fc80c98c6e9878085"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.12/ccusage-gauge_#{version}_#{arch}.app.zip"
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
