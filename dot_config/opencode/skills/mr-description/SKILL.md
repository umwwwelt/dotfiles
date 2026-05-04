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

Génère la description très concise d'une MR en analysant les diffs de la branche. La liste doit être proportionnelle, à la quantité. 
Si c'est une toute petite mr, une phrase suffit.

## Analyse

1. Lire les diffs : `git diff base..HEAD`
2. Identifier les modules/fonctionnalités modifiés
3. Regrouper par module (pas par type Feature/Fix/Refactor)
4. Générer un titre concis (max 50 caractères) : `type(scope): description`
   - type: feat, fix, refactor, docs, test, chore
   - scope: module principal modifié
   - description: action principale en impératif

## Titre de la MR

Proposer le titre généré à l'utilisateur :

```
Titre proposé : "feat(auth): ajoute la validation JWT"
```

Demander confirmation ou correction :
- **Confirmer** → passer à la génération de la description
- **Corriger** → attendre le nouveau titre et l'utiliser

## Description de la MR

Générer la description selon les règles de taille et de format ci-dessous, puis la présenter à l'utilisateur.

Demander confirmation ou correction :
- **Confirmer** → passer à la mise à jour glab
- **Corriger** → attendre la nouvelle description et l'utiliser

## Mise à jour GLab

Si l'utilisateur confirme le titre et la description :

```bash
glab mr update <MR_NUMBER> --title "<TITRE_CONFIRME>" --description "<DESCRIPTION_CONFIRMEE>"
```

Si aucun MR_NUMBER n'est fourni, récupérer via :
```bash
glab mr list --source-branch $(git branch --show-current)
```

## Taille de la MR

La description doit être **proportionnelle à la quantité de changements** :

| Taille | Critères | Format |
|--------|----------|--------|
| **Tiny** | 1 fichiers, < 50 lignes | 1 phrase, bloc simple ``` |
| **Small** | 2-3 fichiers, < 100 lignes | 1-2 chapitres, 1-2 points par chapitre |
| **Medium** | 4-5 fichiers | Format standard, 2-3 chapitres |
| **Large** | > 6 fichiers | Format complet, focus sur les changements majeurs |

**Règle d'or** : Si la MR tient dans une phrase, ne pas forcer le format chapitres.

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
- **Tiny MR** : pas de chapitres, juste une phrase
- Autres : chapitres `#### NomDuModule` (2-4 max)
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

## Exemples

### Tiny MR (1-2 fichiers ou moins de 50 lignes)

```
Ajout de la validation email sur le formulaire de contact
```

### Standard

```
#### Authentification

- JWT workflow
  - login -> token -> validation -> refresh
- API `POST /auth/login`
- Token tracking

#### Refactoring

- Extraction helpers `auth/helpers.ts`
```
