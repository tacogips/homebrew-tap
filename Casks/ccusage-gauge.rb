cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "83f7bb5f8ab3fce30529fef076ee90fab6629633d19517282b247309398dec09",
         intel: "f97024b8fffb71d0c518487aae6aab9c14a027984cb3557ce54c1d585b298aa7"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.2/ccusage-gauge_#{version}_#{arch}.app.zip"
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
