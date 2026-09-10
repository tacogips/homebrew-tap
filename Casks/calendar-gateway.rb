cask "calendar-gateway" do
  version "0.1.5"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "9b7675a3afc4c399a248ad08be22d8480ef82d3f84c5c6cdb58d4366b80d2a8d",
         intel: "8da13918c710ae559741b543327e6ece4774230b0b997e4b89987414f6635d3c"

  url "https://github.com/tacogips/calendar-gateway/releases/download/v0.1.5/calendar-gateway-#{version}-#{arch}.dmg"
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
