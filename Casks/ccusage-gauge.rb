cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.23"
  sha256 arm:   "2a85eaa79716b26e60897506266c092b738b8b636b6df9a9758293546a7253d9",
         intel: "2df1b8127f9de0e71e9c9fb0b7f3e62f0f268312385868b5a74ad7f7df9468a9"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.23/ccusage-gauge_#{version}_#{arch}.app.zip"
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
