class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.3/rielflow-0.1.3-darwin-arm64.tar.gz"
      sha256 "4f46fb9364dbd7f9ed0025386024666ed580ce879909b076206c2ad1aca9cdcd"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.3/rielflow-0.1.3-darwin-x64.tar.gz"
      sha256 "57009122771098f79caa7a378e38d7df1a8dba11a84c9fdf600e73a3571b787c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.3/rielflow-0.1.3-linux-arm64.tar.gz"
      sha256 "64eae56e9c100d3eb678879af479d6e601f069c08f49b4d8567869ff7b93c232"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.3/rielflow-0.1.3-linux-x64.tar.gz"
      sha256 "0b277741d4c56f3697db6cd6040716029dddc049146e50fa95a9bc47ee319a2e"
    end
  end

  def install
    bin.install "bin/rielflow"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rielflow --help")
  end
end
