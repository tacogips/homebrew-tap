cask "chilla" do
  version "0.1.18"
  sha256 "a2b08c07c17f9358b7eba5a1448d6e72cb7acf8b37322a4b17c05d036d97b778"

  url "https://github.com/tacogips/chilla/releases/download/v#{version}/chilla_#{version}_aarch64.dmg"
  name "chilla"
  desc "Lightweight file and Git viewer"
  homepage "https://github.com/tacogips/chilla"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "chilla.app"
  binary "#{appdir}/chilla.app/Contents/MacOS/chilla", target: "chilla"
end
