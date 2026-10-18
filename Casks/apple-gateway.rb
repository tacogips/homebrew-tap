cask "apple-gateway" do
  version "0.1.17"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "8054b0b067b2231b88fe6b9359bdc3dab1fb6b958e793a11dc48b28cc7033427",
         intel: "5b2a811aa781577de4f119d4d953139b8135e53ff38ff5ebe8ced6b571933e47"

  url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.17/apple-gateway-full-#{version}-#{arch}.dmg",
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
