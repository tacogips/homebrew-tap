cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.22"
  sha256 arm:   "72a0905516fb4c859da5e7b37ab1b9e808c6a3723d25a4a6492c1afc209f8de8",
         intel: "edd8d6633ee4f9cde160d6baca78cbd5599736f3f9265f8218a59462d747c26c"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.22/ccusage-gauge_#{version}_#{arch}.app.zip"
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
