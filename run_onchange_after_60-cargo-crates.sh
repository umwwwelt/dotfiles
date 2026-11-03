#!/bin/sh
# Crates installées via cargo, faute de formule Homebrew.
#
# `run_onchange_` : ne se rejoue que si ce fichier change (ajout d'une crate).
# Pour mettre à jour, relancer `cargo install --locked <crate>` à la main.
# Échec toléré : un apply hors-ligne ne doit pas casser pour un outil cosmétique.

set -u

command -v cargo >/dev/null 2>&1 || exit 0

cargo install --locked pyroclear || true
