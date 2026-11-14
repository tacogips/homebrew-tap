cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.16"
  sha256 arm:   "cf4e1ab5f29d44fbf93879383a06cede102474dfdc8888cd7235af3f66567003",
         intel: "b35d02106b651158110d8345cfb6658ddae8020dcf8253ac6c678a98d6b36aca"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.16/ccusage-gauge_#{version}_#{arch}.app.zip"
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
