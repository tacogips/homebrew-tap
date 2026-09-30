cask "google-calendar-gateway" do
  version "0.1.8"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "333feefaed17d8c6b25d8d1924d517fb48d1962be73cc8c795ea0f5cd1ca31e7",
         intel: "64cb11ba459ed4bb41f94688986e4504aa64ab71b9bcc6408a059f1966cde776"

  url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.8/google-calendar-gateway-#{version}-#{arch}.dmg"
  name "google-calendar-gateway"
  desc "Swift library and local CLI gateway for calendar clients"
  homepage "https://github.com/tacogips/google-calendar-gateway"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "google-calendar-gateway-reader"
  binary "google-calendar-gateway-writer"

  caveats do
    <<~EOS
      This cask installs the signed and notarized macOS command line tools.
      Homebrew links google-calendar-gateway-reader and google-calendar-gateway-writer into the native Homebrew prefix for this Mac.
    EOS
  end
end
