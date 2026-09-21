---
name: artefact
description: Construire un artifact sur la base de design maison, le Socle Grimoire. À utiliser dès qu'un artifact, une note de conception, un compte rendu ou un document de continuité est demandé.
---

# Artefact

Tout artifact se construit sur la base de design maison, publiée en artifact sous le nom
**Socle Grimoire**, jamais sur une identité visuelle inventée pour l'occasion.

- **Socle** (la base réutilisable) : <https://claude.ai/artifact/SFmeuLtHwiBxpJ7w389wRn> — favicon 📐
- **Grimoire** (un document réel bâti dessus, comme exemple) : <https://claude.ai/artifact/2FC8G57t57E1C3dQipWntm>

## Marche à suivre

1. **Lire le socle avant d'écrire la moindre ligne de HTML** : outil Artifact, `action: "read"`,
   `url` du socle. Il contient son propre mode d'emploi en commentaires. Ne jamais reconstituer
   son CSS de mémoire — le fichier publié fait foi.
2. Copier son CSS **à l'identique**, puis remplacer le contenu de `<article class="doc">`.
3. Ne pas ajouter `<!doctype>`, `<html>`, `<head>`, `<body>` : l'artifact les injecte. Garder
   `<title>` tout en haut, dans les 8 premiers Ko.
4. Favicon emoji au premier publish uniquement, jamais aux republications.

## Ce qui constitue l'identité, à ne jamais retirer

- La **colonne de glose marginale** (`.row` / `.gloss`) : c'est l'effet manuscrit qui signe le
  document. Une glose porte une preuve, une mesure, un chemin de fichier, une définition.
- La **structure de thème en trois blocs** : `:root` nu pour la palette claire complète, puis
  `@media (prefers-color-scheme: dark)` gardé par `:root:not([data-theme="light"])`, puis
  `:root[data-theme="dark"]`. Toute couleur doit exister sur `:root` nu.
- Le **masthead** : `h1` serif énorme en `--lapis`, eyebrow et meta en mono.
- La **bascule clair/sombre** : son CSS, son markup `.theme-bar` en tête de `.doc`, **et** son
  `<script>` en fin de fichier. Les trois vont ensemble ; le style sans le script livre un
  bouton mort.

## Pièges

- Un seul `<defs>` de marqueurs par document, remonté en tête : deux figures copiées donnent deux
  `id="dg-arrow"`, et tous les `url(#dg-arrow)` pointent alors sur le premier.
- Le vocabulaire de schéma SVG (`dg-box`, `dg-line`, `dg-title`, `dg-sub`…) est le plus long à
  reconstruire : le recopier tel quel plutôt que de le réinventer.
- Ouvert en local, le fichier du socle passe en quirks mode : le rendu de référence est celui de
  l'artifact publié.

## Ce que le socle ne dicte pas

Sa suite de sections est un échantillonnage de composants, pas un plan à suivre. On prend ce que
le sujet réclame — un document peut n'être que des tableaux, un autre n'avoir aucun schéma — et on
jette le reste. Les composants disponibles : `.statement`, `figure` + `.fig-scroll`, tableaux à
filets, `.lot` + `ol.tickets`, `.options`, `ul.plain`, `.lead`, `.dead`.

Ajouter des classes propres au document est légitime, à condition de les dériver des tokens
existants et de les regrouper dans un bloc CSS final clairement identifié.
