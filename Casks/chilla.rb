cask "chilla" do
  version "0.4.2"
  sha256 "33340a3453c937eecdd1d224d54fa399297bc3395c12cc78ebaaa5ae1e2851ac"

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
