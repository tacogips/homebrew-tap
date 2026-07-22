cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.11"
  sha256 arm:   "8e3bb20ca2529ef36ca281b021b2c7071bbd1113e9d93a258840599543bc65ac",
         intel: "34665b10f31922887c3aaf4f083cfa62dc95b8a012a38bed408cd68aecc8d6c3"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.11/ccusage-gauge_#{version}_#{arch}.app.zip"
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
