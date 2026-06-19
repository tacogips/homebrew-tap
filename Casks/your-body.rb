cask "your-body" do
  version "0.1.0"
  sha256 "c82204258ed481f264275134a1d969a9fc9d1e25aab21de8ab77318029313506"

  url "https://github.com/tacogips/your-body/releases/download/v#{version}/YourBody_#{version}_aarch64.dmg",
      verified: "github.com/tacogips/your-body/releases/download/"
  name "Your Body"
  desc "Local-first nutrition, food photo, voice, exercise, and Apple Health-assisted logging"
  homepage "https://github.com/tacogips/your-body"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Your Body.app"
end
