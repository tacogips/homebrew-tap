cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.26"
  sha256 arm:   "aa2da7cf614c7c2055e5b1e0816aa9f53cafbdc38d194eb066a2e38b6dffef34",
         intel: "b3102adadef8987190d0d82b9867f24988ae5fab2249fa71decfe16b627f9b83"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.26/ccusage-gauge_#{version}_#{arch}.app.zip"
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
