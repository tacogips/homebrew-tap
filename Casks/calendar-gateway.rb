cask "calendar-gateway" do
  version "0.1.1"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "2400c83cb2dc3b9873977acda253938645a44e5416edd6dab0219aa5e42024b8",
         intel: "a88ce84ee18ad580d262bbfe2a3df39ed5b1eee96ca7daaf1a1cca63c0447f00"

  url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.1/calendar-gateway-#{version}-#{arch}.dmg"
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
