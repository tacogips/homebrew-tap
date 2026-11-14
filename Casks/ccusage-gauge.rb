cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.15"
  sha256 arm:   "9748ae7af2d3e8aaf0ff156e89a93d95bc8c0836e0ab4bb46cdff82dd3aecf57",
         intel: "4c5feede6af9c2f3f88a945fa0cdd0084bcc262583431196c52dc81ce84ee516"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.15/ccusage-gauge_#{version}_#{arch}.app.zip"
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
