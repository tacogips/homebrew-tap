cask "apple-gateway" do
  version "0.1.1"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "ba37c468fa7a496c2794efd5856d3b90623ed6daabfcd22d8a32a98f1256c247",
         intel: "81720a0c2bd3d3f9fad5da4523f2b74f016ddfff9f09acbb40ca2233f27a59ef"

  url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.1/apple-gateway-#{version}-#{arch}.dmg",
      verified: "github.com/tacogips/apple-gateway/releases/download/"
  name "apple-gateway"
  desc "macOS CLI and GraphQL bridge for Apple apps"
  homepage "https://github.com/tacogips/apple-gateway"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "apple-gateway"
  binary "apple-gateway-reader"
  artifact "libexec/AppleGatewayNotifier.app", target: "#{HOMEBREW_PREFIX}/libexec/AppleGatewayNotifier.app"
  caveats do
    <<~EOS
      This cask installs the signed and notarized macOS command line tools,
      and the AppleGatewayNotifier helper app.
      Homebrew links apple-gateway and apple-gateway-reader into the native Homebrew
      prefix for this Mac.
    EOS
  end
end
