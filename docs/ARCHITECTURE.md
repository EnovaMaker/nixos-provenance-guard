# Architecture (design)

## Overview

nixos-provenance-guard targets the gap Nix's content-addressed store leaves open:
a pinned input is cryptographically protected, but nothing verifies the *update*
that produces a new pin. It hooks flake-input updates, verifies each new
revision is a legitimate history continuation of the prior one, and scores each
input's supply-chain health — declarative, audit-ready, no external SaaS.

## Module architecture

```
supplyChain (services.supplyChain.enable = true)
├── updateGuard (services.supplyChain.updateGuard.*) — ancestry verification on flake-input updates
├── riskScore   (services.supplyChain.riskScore.*)   — OSSF-Scorecard-style per-input risk scoring
├── integrity   (services.supplyChain.integrity.*)   — store integrity + provenance (reused from earlier prototype)
└── ci          (services.supplyChain.ci.*)          — fail CI on diverged ancestry or low-scoring new inputs
```

## Integration points

- **updateGuard → baselines.json**: last-known-good revision per input, advanced only on a confirmed legitimate update.
- **riskScore → risk-scores.json**: cached OSSF Scorecard results per input, refreshed on a timer.
- **updateGuard + riskScore → ci**: `guard report` combines both into a single pass/fail gate.

## Security & constraints

- Network-optional throughout: a failed ancestry or Scorecard check degrades to "unknown"/cached, never a hard crash.
- `failOnDiverged` on by default (a real, in-our-control compromise signal); `failOnLowRisk` off by default (a third-party network dependency).
- Dependency-light CLI (Python stdlib + click/tabulate only).

## Status

Design phase — full implementation lives in `github/` and becomes public as
milestones are claimed post-GA.
