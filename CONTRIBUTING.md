# Contributing — nixos-provenance-guard

- Module contributions follow the NixOS module conventions (option naming, types from `lib`).
- Code is MIT licensed; all results published openly.
- PRs should target `main`; CI runs on `main` and PR branches.
- Python: keep dependency-light (`click`, `tabulate` only). Run `python3 -m py_compile`.
- Nix formatting: `nix fmt` (nixpkgs-fmt), optional.
- For nixpkgs upstream: split PRs per module and include integration tests in `nixos/tests/all*`.