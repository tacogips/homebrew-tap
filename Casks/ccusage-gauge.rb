cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.20"
  sha256 arm:   "0626567fac3d4a82810f0984df2b64f1b9dba950d073b16cf532a10e22c1da6a",
         intel: "ec6d57e1d9e1a1e1420dd104cbc98e1eb9cf89251243052f1aba2864ebbdcf29"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.20/ccusage-gauge_#{version}_#{arch}.app.zip"
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
