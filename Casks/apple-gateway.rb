cask "apple-gateway" do
  version "0.1.18"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "c253c716790bda8a7c7a513074d7851f88ab4be89a9e63026d2adaff654cddec",
         intel: "d09ec17b1536219b2545db645ca111b4bf4d8b917e80875282d962a3e3e17962"

  url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.18/apple-gateway-full-#{version}-#{arch}.dmg",
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
