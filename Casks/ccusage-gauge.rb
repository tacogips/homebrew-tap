cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.17"
  sha256 arm:   "d491be8f90acba4f99ca307e8ec238da10cde25323958e6309e3866289cc0f8f",
         intel: "e2cf7b1528ca3557d439d7b94667c1e63f16afeedbd7d0b747f7aafb7933aab8"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.17/ccusage-gauge_#{version}_#{arch}.app.zip"
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
