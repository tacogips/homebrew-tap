cask "apple-gateway" do
  version "0.1.16"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "1e828bf5d9eea11f099ca33c0abfb693a287a10a255e2fff89e397ebeb421c7b",
         intel: "f36fdb287b001a1ed9c7745055d7ff7bcf53c7f634fa00adc2202734de661ce6"

  url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.16/apple-gateway-full-#{version}-#{arch}.dmg",
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
      This cask installs the signed and notarized macOS command line tools and notifier helper.
      Homebrew links apple-gateway into the native Homebrew prefix for this Mac.
    EOS
  end
end
