cask "riela" do
  version "0.1.6"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "ed2d6d14320cfd58166e9d568f065a08e77262eefe5fe7a3b6777b72c63078e7",
         intel: "23a01030cacc117c80327845c196773bdead994c804b0196f9ecf1112fb26652"

  url "https://github.com/tacogips/riela/releases/download/v0.1.6/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime with the macOS menu bar app and CLI"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "RielaApp.app"
  binary "riela"

  caveats do
    <<~EOS
      This cask installs RielaApp.app and links riela into the native Homebrew prefix for this Mac.
      For the command line tool only, install the formula instead:
        brew install riela
    EOS
  end
end
