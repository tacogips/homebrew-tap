cask "chilla" do
  version "0.1.10"
  sha256 "4ba90d9f6e2a6e62c8ae0b310b49883a0cd55cd14a2803558aadb65d4fef92c0"

  url "https://github.com/tacogips/chilla/releases/download/v#{version}/chilla_#{version}_aarch64.dmg"
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
