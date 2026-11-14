cask "calendar-gateway" do
  version "0.1.2"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "f9d1aa6b7d6c9a901bc82427e7676d5a87868c511919d0dc2e21877029dd674b",
         intel: "2bdfabc8106ee731b1d18371c484abc3e828cd594514067dfdfbb5bc038241e3"

  url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.2/calendar-gateway-#{version}-#{arch}.dmg"
  name "calendar-gateway"
  desc "Swift library and local CLI gateway for calendar clients"
  homepage "https://github.com/tacogips/calendar-gateway"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "calendar-gateway"

  caveats do
    <<~EOS
      This cask installs the signed and notarized macOS command line tool.
      Homebrew links calendar-gateway into the native Homebrew prefix for this Mac.
    EOS
  end
end
