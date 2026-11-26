cask "ccusage-gauge" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.5.0"
  sha256 arm:   "cf886af7fd972206c87da09ece6ce14e6db3bb00a6d1c590ef44d2abc338b9af",
         intel: "64a2fa7aa6cbdf01cfe3fa5fc1ed763a90dba4aba6c353c2959ad277891c006e"

  url "https://github.com/tacogips/ccusage-gauge/releases/download/v0.5.0/ccusage-gauge-#{version}-#{arch}.dmg"
  name "CCUsage Gauge"
  desc "Menu bar gauge for Claude Code and Codex subscription limits, credits, and costs"
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
