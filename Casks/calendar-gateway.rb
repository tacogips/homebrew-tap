cask "calendar-gateway" do
  version "0.1.3"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "d6558af053f5382941a57a6a85dbc95287e0c2fdd2e8f023c207115d5305dfef",
         intel: "f345d99272b28cbcdfb786c2cfd1de6544ab47dfa1c53abeddb210724b6af521"

  url "https://github.com/user/repo/releases/download/v0.1.3/calendar-gateway-#{version}-#{arch}.dmg",
      verified: "github.com/user/repo/releases/download/"
  name "calendar-gateway"
  desc "A Swift command line tool"
  homepage "https://github.com/user/repo"

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
