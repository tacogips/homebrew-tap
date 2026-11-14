cask "chilla" do
  version "0.1.7"
  sha256 "a933537167f447c42b43661c3ba45fb5b1fd40c62ade7b674c9b902f067d67ab"

  url "https://github.com/tacogips/chilla/releases/download/v#{version}/chilla_#{version}_aarch64.dmg",
      verified: "github.com/tacogips/chilla/releases/download/"
  name "chilla"
  desc "Lightweight file and Git viewer"
  homepage "https://github.com/tacogips/chilla"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "chilla.app"
  binary "#{appdir}/chilla.app/Contents/MacOS/chilla", target: "chilla"

  caveats do
    <<~EOS
      This cask installs the current macOS DMG release artifact.

      The current DMG is not signed and notarized yet, so Gatekeeper may still block launch
      until the release pipeline is upgraded to publish a trusted macOS artifact.
    EOS
  end
end
