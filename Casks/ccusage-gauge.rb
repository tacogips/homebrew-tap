cask "ccusage-gauge" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.2.0"
  sha256 arm:   "6d663709d71fbbdfcb1f998f10bf5c9e12e8056ce73370ba07c2392611f9d699",
         intel: "25fc6c560631d0c0f68575b6f62f6db8d0a2936840553f729a58ad10b512ec9f"

  url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.2.0/ccusage-gauge-#{version}-#{arch}.dmg"
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
