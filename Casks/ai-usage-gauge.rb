cask "ai-usage-gauge" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.5.1"
  sha256 arm:   "46b8c94d7870a9fd26353b8463917daa689c038cccb6c2126e5b36f619ba4745",
         intel: "75c18d08c26920b2f07d1e3387e8674e6f5a6051cd8c29fffde57a426a48b964"

  url "https://github.com/tacogips/ai-usage-gauge/releases/download/v0.5.1/ccusage-gauge-#{version}-#{arch}.dmg"
  name "AI Usage Gauge"
  desc "Menu bar gauge for Claude Code, Codex, and Gemini subscription limits, credits, and costs"
  homepage "https://github.com/tacogips/ai-usage-gauge"

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
