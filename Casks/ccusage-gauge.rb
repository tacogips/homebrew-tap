cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.25"
  sha256 arm:   "35f738c2c4a457e2867721fc8936dab76a176594d7a32ac890e28a1c3f0952de",
         intel: "084c4e952180b8e79f39c49767d3e91667fc5be5eec36d2e227fb7bb9dbf96a7"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.25/ccusage-gauge_#{version}_#{arch}.app.zip"
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
