cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.24"
  sha256 arm:   "8914aa6c6efc8bfeee3392173e3504e78dc1d5171197c3c0af39d5ea2e404a7c",
         intel: "13a8866a2a3ae806161bcdb72d34c1e557036f3cc836e61eed2c1dd55042a340"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.24/ccusage-gauge_#{version}_#{arch}.app.zip"
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
