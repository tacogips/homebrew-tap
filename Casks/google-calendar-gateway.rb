cask "google-calendar-gateway" do
  version "0.1.9"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "a7222dc2e2935fff0cd336f1aaaf4d56dad2553b1171f7d35561cdc4b9df16e1",
         intel: "353be38ff8fda1c1ceebf78f41998dae960c8985dfddcee819bfbf40c029eef8"

  url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.9/google-calendar-gateway-#{version}-#{arch}.dmg"
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
