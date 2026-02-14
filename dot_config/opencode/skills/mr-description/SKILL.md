---
name: mr-description
description: Génère la description d'une MR avec chapitres par module et sous-listes concises
license: MIT
allowed-tools:
  - read
  - glob
  - grep
  - bash
---

# Skill Description MR

Génère la description très concise d'une MR en analysant les diffs de la branche.

## Analyse

1. Lire les diffs : `git diff base..HEAD`
2. Identifier les modules/fonctionnalités modifiés
3. Regrouper par module (pas par type Feature/Fix/Refactor)

## Format

Organisation en chapitres (2-4 max) :

```
#### NomDuModule

- Description courte (2-4 mots)
  - workflow étape1 -> étape2 -> étape3
  - détail
- Point clé `fichier.ts`
```

## Règles

### Structure
- Chapitres : `#### NomDuModule` (2-4 max)
- Max 2-3 points par chapitre
- Points avec `-`, sous-points indentés (2 espaces)
- Sortie dans bloc ``` pour copier directement

### Contenu
- Ultra concis : 2-4 mots par ligne
- Pas de gras
- Workflows : `->`
- Fichiers/fonctions : `` `backticks` ``

### Hiérarchisation
1. Fonctionnalités métier et nouveautés principales
2. API/Worker (nouveaux ou modifiés)
3. Refactoring/structure (1 ligne max, dernier chapitre)

### Anti-doublon
- Fusionner les concepts identiques : pas "endpoint" + "route" séparément → écrire "API `GET /path`"
- Un concept = une ligne, pas de reformulation
- Pas de détails sur helpers/utilitaires privés
- Ne pas lister : builder + schema + helper séparément → résumer en "modèles `fichier.ts`"

## Exemple

```
#### Authentification

- JWT workflow
  - login -> token -> validation -> refresh
- API `POST /auth/login`
- Token tracking

#### Refactoring

- Extraction helpers `auth/helpers.ts`
```
