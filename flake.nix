{
  description = "nixos-provenance-guard: Update-time provenance verification and supply-chain risk scoring for Nix flakes (design preview — no buildable code in this tree, see docs/)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  # This preview tree intentionally ships no modules/cli/tests (see README:
  # "Design phase. Full implementation at `github/`"). Do not add
  # nixosModules/packages outputs here unless the referenced files actually
  # exist in this tree — a prior version referenced ./modules paths that
  # were never copied in, which broke `nix flake check`.
  outputs = { self, nixpkgs, flake-utils }: { };
}