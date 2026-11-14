cask "ccusage-gauge" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.21"
  sha256 arm:   "ceb68c575c7af0e09db50423b8f8856ed5fd23332f20cad073cace8dad525e11",
         intel: "2669c253e21803e9a775d50dc282acff7ed475773fda140fd3e7b3d0e1455740"

  url "https://github.com/tacogips/homebrew-tap/releases/download/ccusage-gauge-v0.1.21/ccusage-gauge_#{version}_#{arch}.app.zip"
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
