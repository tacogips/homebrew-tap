cask "ccusage-gauge" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.4.1"
  sha256 arm:   "ee7a0de4c2070d9071001c7e88c7b2beeed622383d9769509acf6c097d82e9d9",
         intel: "baf9c9903a7d41986b2f84108012f392d78d606659666626608cd7d63ce49a29"

  url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.4.1/ccusage-gauge-#{version}-#{arch}.dmg"
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
