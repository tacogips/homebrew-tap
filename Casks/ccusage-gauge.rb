cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.27"
  sha256 arm:   "e3edcedb4a7dacc27b5e295343d3eabe5a0a705b15423ade69e4cd4e8c773f44",
         intel: "1a15c479d99fbc9f0292601efb797cbc9df05420adc45407a0597546c1fe31be"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.27/ccusage-gauge_#{version}_#{arch}.app.zip"
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
