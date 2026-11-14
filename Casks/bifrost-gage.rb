cask "bifrost-gage" do
  version "0.1.0"
  sha256 "7534664858d41f215abf08b756c0453c1d980cb0ba74ad73326e47f8533be907"

  url "https://github.com/tacogips/homebrew-tap/releases/download/bifrost-gage-v#{version}/bifrost-gage_#{version}_aarch64.app.zip"
  name "bifrost-gage"
  desc "Menu bar app for local Bifrost budget status and controls"
  homepage "https://github.com/tacogips/bifrost-gage"

  livecheck do
    skip "Release assets are hosted in the shared tap repository"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "bifrost-gage.app"
  binary "#{appdir}/bifrost-gage.app/Contents/MacOS/bifrost-gage", target: "bifrost-gage"

  caveats do
    <<~EOS
      bifrost-gage connects to an already-running Bifrost server. Configure the
      Bifrost URL and Virtual Key from the menu bar app, or edit:

        ~/.config/bifrost-gage/bifrost-gage-config.json

      This cask installs the current Apple Silicon app zip release artifact.
      The current artifact is ad-hoc signed and not notarized, so macOS
      Gatekeeper may require a manual first-launch approval.
    EOS
  end
end
