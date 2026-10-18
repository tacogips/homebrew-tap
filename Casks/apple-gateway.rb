cask "apple-gateway" do
  version "0.1.14"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "03127e82a4de3fe8ce728d3e7bc18b8a4b301e2193676ccb33b55fb5f608949b",
         intel: "956f215965de52190e00ec2c913f6d11dae4784c758a7cb0c9cbc0f42116cb2a"

  url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.14/apple-gateway-full-#{version}-#{arch}.dmg",
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
