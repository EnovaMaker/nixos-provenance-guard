# Roadmap (design)

> Pivotado antes do M1, de nixos-supply-chain (SBOM/CVE) — ver `README.md`.

## Phase 1 (current) — Foundation
- [x] Module architecture design (`services.supplyChain.*`)
- [x] flake.nix with module imports
- [x] Design docs (ARCHITECTURE, ROADMAP)
- [x] Update-guard module: ancestry verification (GitHub compare API + git fallback)
- [x] Risk-score module: OSSF Scorecard API integration + cache
- [x] Integrity module (reused from earlier prototype)
- [x] CI module: gate on diverged ancestry / low risk-score

## Phase 2 — Hardening
- [x] Integration tests in NixOS VMs (update-guard, risk-score, integrity, full-stack)
- [ ] CI matrix (24.05 + unstable) actually run (needs a real `nix` — not available in the drafting sandbox)
- [ ] Live smoke test against the real GitHub compare API and OSSF Scorecard API (code written defensively, not yet exercised live)
- CLI: `guard check | risk | report | verify | integrity-check`

## Phase 3 — Upstream
- nixpkgs PR for the module
- Documentation EN + PT
- Demo deployment + community operator guide
