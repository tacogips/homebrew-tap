class Rielflow < Formula
  desc "TypeScript/Bun workflow runtime for cooperative multi-agent execution"
  homepage "https://github.com/tacogips/rielflow"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.2/rielflow-0.1.2-darwin-arm64.tar.gz"
      sha256 "7b404d88a5202451dd25f2998e8e8a3db3f25d1936f423bf138f073f2e1fadbb"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.2/rielflow-0.1.2-darwin-x64.tar.gz"
      sha256 "2d9148bd50a56291854edbc956b838482dc706a496b961446d6be7b4b60f4073"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.2/rielflow-0.1.2-linux-arm64.tar.gz"
      sha256 "78438a567d3b00dafa2313dffbcf07d7c378defd7b90132ca8cd6ccd1354012a"
    else
      url "https://github.com/tacogips/rielflow/releases/download/v0.1.2/rielflow-0.1.2-linux-x64.tar.gz"
      sha256 "de2e854bfc162ca9fb710b6e31f9badc194b0616e6135dc3b1c9e06a55ef513f"
    end
  end

  def install
    bin.install "bin/rielflow"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rielflow --help")
  end
end
