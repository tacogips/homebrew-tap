cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.14"
  sha256 arm:   "8a590435d0adc7116ca46780dcf5fdc67fe1b46530996cd39a30c99d53769e05",
         intel: "a32d46aaceea792b97aa867f930c80e7b8c36fc8a5b81aa1587c7df3d6f388f0"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.14/ccusage-gauge_#{version}_#{arch}.app.zip"
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
