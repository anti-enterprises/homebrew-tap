# Anti-Enterprises Homebrew Tap

Homebrew tap for Anti-Enterprises CLI tools.

## Install Anti-CRM

After the `anti-crm` GitHub release is published and this tap is pushed to GitHub:

```bash
brew install anti-enterprises/tap/anti-crm
```

Or tap first:

```bash
brew tap anti-enterprises/tap
brew install anti-crm
```

## Maintenance

The `anti-crm` formula is generated from the main project repo:

```bash
cd /Users/x/Projects/anti-crm
bun run release:pack
bun run homebrew:render --allow-partial
cp dist/homebrew/anti-crm.rb /Users/x/Projects/homebrew-tap/Formula/anti-crm.rb
```

The formula must reference GitHub Release assets that exist publicly and match the embedded SHA-256 checksums.
