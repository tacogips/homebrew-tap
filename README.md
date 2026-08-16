# homebrew-tap

Custom Homebrew tap for `tacogips` packages.

The `api/formula/` and `api/cask/` directories publish generated Homebrew JSON
metadata so clients such as mise can resolve packages directly from this tap.
Metadata is regenerated automatically whenever a formula or cask changes.

## Available formulae

- `anydoc-swift`
- `calendar-gateway`
- `ccusage-gauge`
- `divedra`
- `ign`
- `kinko`
- `riela`

## Available casks

- `bifrost-gauge`
- `calendar-gateway`
- `chilla`
- `ccusage-gauge`
- `kaiba`
- `riela`

## Usage

```bash
brew tap tacogips/tap
brew install anydoc-swift
brew install calendar-gateway
brew install ccusage-gauge
brew install divedra
brew install ign
brew install kinko
brew install riela
brew install --cask bifrost-gauge
brew install --cask calendar-gateway
brew install --cask chilla
brew install --cask ccusage-gauge
brew install --cask kaiba
brew install --cask riela
```
