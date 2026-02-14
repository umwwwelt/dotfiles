---
name: refactor
description: Refactoriser avec un code minimaliste, sans changement de comportement
license: MIT
allowed-tools:
  - read
  - glob
  - grep
  - apply_patch
---

# Skill Documentation (refactor)

Transforme le code en version minimaliste, pro, sans fioritures, sans changer le comportement.

## Ce que je fais

- Refactorise pour obtenir un code court, net, tres pro
- Elimine la verbosite et les fioritures
- Applique des patterns modernes (2026) sans sur-architecturer

## Ce que je ne fais pas

- Ne change pas les API, comportements, schemas, ou contrats
- Pas de refactor cosmetique ni reformatage gratuit
- Pas de code verbeux ou decoratif

## Workflow

1. Lire et comprendre le code existant
2. Refactoriser vers une version minimaliste et professionnelle
3. Verifier que le comportement reste identique
4. Lancer la commande agent `/lint` en fin de travail

## Regles de style

- Code minimaliste, structure claire, pas de sur-abstraction
- Commentaires rares, uniquement si necessaire
- Favoriser les noms expressifs et les helpers courts
