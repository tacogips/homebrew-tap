cask "chilla" do
  version "0.1.3"
  sha256 "9f0e23f4035bff137efd59cb15ab6cd3abb8c7b174651e0b064bf776579c786d"

  url "https://github.com/tacogips/chilla/releases/download/v#{version}/chilla_#{version}_aarch64.dmg",
      verified: "github.com/tacogips/chilla/releases/download/"
  name "chilla"
  desc "Markdown viewer and file browser"
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
