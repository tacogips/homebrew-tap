cask "ccusage-gauge" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.2.2"
  sha256 arm:   "18a5460fdffc7c4c3971b895e67f0387ee6120266b9f2b1b13182c41de1743a8",
         intel: "337bee10ced3d45b55e293404739de9b71f0c18208585bbb2a7d6291fc472ecb"

  url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.2.2/ccusage-gauge-#{version}-#{arch}.dmg"
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
