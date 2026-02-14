---
name: doc
description: Recherche automatiquement la documentation à jour via Context7 en déduisant la librairie du contexte
license: MIT
allowed-tools:
  - context7_resolve-library-id
  - context7_query-docs
---

# Skill Documentation (doc)

Ce skill récupère automatiquement la documentation à jour via Context7.

## Comment fonctionner

1. **Analyser le prompt** pour identifier :
   - La librairie/framework/outil mentionné (React, Vue, Node.js, etc.)
   - La question ou le besoin spécifique

2. **Rechercher la librairie** via `context7_resolve-library-id` avec le nom déduit

3. **Si ambiguïté** (plusieurs résultats pertinents) :
   - Choisir automatiquement le meilleur match (plus haut score benchmark + plus de snippets)
   - OU demander confirmation rapide : "Je cherche la doc de [librairie] - c'est bien ça ?"

4. **Récupérer la documentation** via `context7_query-docs` avec :
   - La question spécifique de l'utilisateur
   - ~5000 tokens par défaut

5. **Répondre directement** avec :
   - La réponse à la question
   - Les exemples de code pertinents
   - Les sources utilisées

## Exemple d'utilisation

L'utilisateur dit : "Comment créer un composant React avec TypeScript ?"
→ Le skill détecte "React" + "TypeScript" et récupère la doc automatiquement.
