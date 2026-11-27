cask "ai-usage-gauge" do
  arch arm: "darwin-arm64", intel: "darwin-x64"

  version "0.6.0"
  sha256 arm:   "1c869fd26aabbf0f6a0ad05c3124eed61fbd1d93903b08b4a18acec9ab7bd90e",
         intel: "2c7f5e5d458b502c1fb45b02bbfcbc0d9598af865b56908416e5c72ef9c7ad89"

  url "https://github.com/tacogips/ai-usage-gauge/releases/download/v0.6.0/ai-usage-gauge-#{version}-#{arch}.dmg"
  name "AI Usage Gauge"
  desc "Menu bar gauge for Claude Code, Codex, and Antigravity subscription limits, credits, and costs"
  homepage "https://github.com/tacogips/ai-usage-gauge"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "AIUsageGauge.app"
  binary "#{appdir}/AIUsageGauge.app/Contents/MacOS/ai-usage-gauge", target: "ai-usage-gauge"

  caveats do
    <<~EOS
      The app and native dashboard are signed and notarized with Apple Developer ID.
      Local usage is computed natively in Rust without requiring a local ccusage CLI.
    EOS
  end
end
