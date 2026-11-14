cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.10"
  sha256 arm:   "8e115d58426ff1b60f07c7dad98d3ce7179c9d3d946290f2c3a7386084737263",
         intel: "014011ce571551ffb8a374df520e25377edcd1684cd3513c8e4c3d34c04ca233"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.10/ccusage-gauge_#{version}_#{arch}.app.zip"
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
