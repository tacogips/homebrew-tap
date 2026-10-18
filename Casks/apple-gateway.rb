cask "apple-gateway" do
  version "0.1.15"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "87e32a441fba69d8ab9625dd260ad675f4bdcc52f306c0b5062909ce9997dc40",
         intel: "7779ae3e92990334506b718153d13756b3f4d46202b27218a23822ff9d741954"

  url "https://github.com/tacogips/apple-gateway/releases/download/v0.1.15/apple-gateway-full-#{version}-#{arch}.dmg",
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
