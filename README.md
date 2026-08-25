# nixos-provenance-guard

**Update-time provenance verification and supply-chain risk scoring for Nix flakes.**

Nix's content-addressed store already protects an *already-pinned* flake input — a
hash mismatch breaks the build. It says nothing about the *update event* itself:
a maintainer-account compromise, a fork-swap, or a repo takeover all produce a
new, cryptographically "valid" revision. This project verifies that a new
revision is a legitimate history continuation of the old one, and scores each
input's supply-chain health, Nix-natively — declarative, integrated in system
configuration and CI.

## Status

Design phase. This repository holds the architecture and public design; see
[docs/ROADMAP.md](docs/ROADMAP.md) for the delivery plan this proposal funds.

**Note:** this project was remodeled before M1 from an earlier SBOM/CVE-auditing
angle (`nixos-supply-chain`) after a competitive-landscape review found that
space already well-served by existing tools (vulnix, sbomnix, and NixOS's own
official Nixpkgs Security Tracker, among others). The `integrity` module below
is reused from that earlier prototype; the update-guard/risk-score mechanism is
new.

## Modules

| Module | Description |
|--------|-------------|
| Update-guard | `services.supplyChain.updateGuard.*` — verify flake-input updates are legitimate history continuations |
| Risk-score | `services.supplyChain.riskScore.*` — OSSF-Scorecard-style per-input risk scoring |
| Integrity | `services.supplyChain.integrity.*` — verify store integrity/provenance (reused) |
| CI | `services.supplyChain.ci.*` — fail CI on diverged ancestry or low-scoring new inputs |

## CLI (planned)

`guard check | risk | report | verify | integrity-check | attest`

## Funding

Proposed to CodeSupply (NLnet), November 2026. Developed alongside
nixos-sovereign-host (Restack) and nixos-local-first (ELFA) — separate
codebases, separate problem domains, none conditional on another being
funded.

## License

[MIT](LICENSE)
