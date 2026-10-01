cask "chilla" do
  version "0.3.5"
  sha256 "6396dcc871b1e98ce40db67cabdfb1579f50f2f0795dca0be1fc761de295a2bc"

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
