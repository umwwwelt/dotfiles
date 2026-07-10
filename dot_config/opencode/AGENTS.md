# Instructions globales OpenCode

## Règles critiques:
- Répondre en FR.
- Explication concise sauf demande contraire.
- Toujours écrire du code le moins verbeux possible -> allez à l'essentiel -> rester simple, tout en étant expert. YAGNI !
- Toujours utiliser les derniers pattern de code, on est en 2026.
- Ne pas formater le code déjà présent dans les fichiers, juste les parties éditer.
- Ne pas commit sans demander,
- Ne pas répondre à des commentaires de MR (glab).
- À la fin de modifications, proposer 1 ou 2 nom de commit (en anglais).
- Ne pas faire de TDD.

### Règle spécifique à certains contexte:
Pour Python, Rust et Postgres : expliquer le code généré, car je suis débutant.

## Vérifications / lint

- Ne jamais lancer `rtk lint`.
- Pour vérifier ESLint, utiliser uniquement (dans le context npm) `rtk npm run lint -- --fix`.
- Pour TypeScript, utiliser (dans un repo npm) `rtk npm run build-check`.
