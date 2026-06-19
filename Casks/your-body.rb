github_token = ENV["HOMEBREW_GITHUB_API_TOKEN"].to_s

cask "your-body" do
  version "0.1.0"
  sha256 "c82204258ed481f264275134a1d969a9fc9d1e25aab21de8ab77318029313506"

  url "https://api.github.com/repos/tacogips/your-body/releases/assets/451688848?filename=YourBody_#{version}_aarch64.dmg",
      header: [
        "Accept: application/octet-stream",
        "Authorization: Bearer #{github_token}",
      ]
  name "Your Body"
  desc "Local-first nutrition, food photo, voice, and exercise logging"
  homepage "https://github.com/tacogips/your-body"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Your Body.app"
end
