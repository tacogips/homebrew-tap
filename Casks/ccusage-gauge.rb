cask "ccusage-gauge" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.4.2"
  sha256 arm:   "dab44a22bf806e33bf0282494e10560087cdc27940912a3d0fc3803a788506ef",
         intel: "96960db9eedde064e63a74595665fb9a61b1c6d292f13098b85b32a70b6f8f70"

  url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.2/ccusage-gauge-#{version}-#{arch}.dmg"
  name "CCUsage Gauge"
  desc "Menu bar gauge and native dashboard for AI coding-agent usage costs"
  homepage "https://github.com/tacogips/ccusage-gauge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "CCUsageGauge.app"
  binary "#{appdir}/CCUsageGauge.app/Contents/MacOS/ccusage-gauge", target: "ccusage-gauge"
  binary "#{appdir}/CCUsageGauge.app/Contents/Helpers/" \
         "CCUsageGaugeDashboard.app/Contents/MacOS/ccusage-gauge-dashboard",
         target: "ccusage-gauge-dashboard"

  caveats do
    <<~EOS
      The app and native dashboard are signed and notarized with Apple Developer ID.
      Install ccusage separately and configure its path if it is not discoverable.
    EOS
  end
end
