cask "google-calendar-gateway" do
  version "0.1.6"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "db107f42f7e49226ced57383c87e166dcd0b0bc4b97732e80b73ac29feefb44c",
         intel: "ecfd5564b4b785cdf2174c462365eca839be6425a68693dba75bee01c3610453"

  url "https://github.com/tacogips/google-calendar-gateway/releases/download/v0.1.6/google-calendar-gateway-#{version}-#{arch}.dmg"
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
