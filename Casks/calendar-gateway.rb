cask "calendar-gateway" do
  version "0.1.4"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "6045deb90c0d1515862568a1af18a9ff3b150476ea9528d4449a35070ac2092a",
         intel: "82f8b52a5c85aa1e87362513444090d82aa9257302dae659f2b6bc8345b6c14d"

  url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.4/calendar-gateway-#{version}-#{arch}.dmg"
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
