cask "chilla" do
  version "0.4.0"
  sha256 "04e3d720ee67813bf4bb7c6fd0969dd47efbd1f8534fa04f9983f36138f3983d"

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
