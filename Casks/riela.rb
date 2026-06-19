cask "riela" do
  version "0.1.3"
  arch arm: "darwin-arm64", intel: "darwin-x64"

  sha256 arm: "c6f86bae39a760ba13e2910cfe816a3db0d4c171b0db0ae3057b76cc40060012",
         intel: "7ab7921609be50996a7fde79a708d1a18e43c056e55af94bc02fae22123ac80f"

  url "https://github.com/tacogips/riela/releases/download/v0.1.3/riela-#{version}-#{arch}.dmg"
  name "riela"
  desc "Swift-native workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/riela"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "riela"

  caveats do
    <<~EOS
      This cask installs the signed and notarized macOS command line tool.
      Homebrew links riela into the native Homebrew prefix for this Mac.
    EOS
  end
end
