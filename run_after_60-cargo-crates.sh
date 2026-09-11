#!/bin/sh
# Crates installées via cargo, faute de formule Homebrew.
#
# `run_after_` (et non `run_onchange_`) : rejoué à chaque `chezmoi apply`, donc
# cargo récupère la dernière version publiée. Sans version épinglée, un
# `run_onchange_` ne se rejouerait jamais et figerait l'install d'origine.
# Échec toléré : un apply hors-ligne ne doit pas casser pour un outil cosmétique.

set -u

command -v cargo >/dev/null 2>&1 || exit 0

cargo install --locked pyroclear || true
