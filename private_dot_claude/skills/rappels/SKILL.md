---
name: rappels
description: Créer des rappels dans l'app Rappels de macOS, toujours dans la liste RF. À utiliser dès que mon message commence par `td` (« td faire relire cette MR »), ou que je donne des todos à programmer, à rappeler ou à mettre dans Rappels (« rappelle-moi de… », « ajoute ces todos », « programme ça pour demain »).
---

# Rappels

Tous les rappels vont dans la liste `RF`. Le nom est écrit en dur dans chaque commande, même si ma demande mentionne une autre liste. Si la commande répond `No reminders list matching RF`, s'arrêter et me prévenir, sans créer de liste ni en essayer une autre.

## Raccourci `td`

Quand mon message commence par `td`, la suite est un todo à noter vite, sans aller-retour :

- Titre : court, à l'infinitif, complété par ce que la conversation et le repo rendent évident. « td faire relire cette mr » sur une branche qui a la MR !42 devient `Faire relire la MR !42 (<projet>)`.
- Notes : les infos utiles pour reprendre la tâche sans contexte, comme le lien de la MR, la branche ou le fichier concerné. Ne rien inventer : ce qui n'est pas sûr reste dehors.
- Échéance : le lendemain à 9:00. Le vendredi, le samedi et le dimanche, le lundi suivant à 9:00. Une date ou une heure que je précise remplace ce défaut.
- Créer directement, sans tableau ni confirmation, puis me donner en une ligne le titre, l'échéance et les notes.

## Étapes

1. Découper ma demande en rappels : un titre court par rappel, une échéance si j'en donne une, des notes si un détail ne tient pas dans le titre.
2. Convertir chaque échéance en date absolue, `YYYY-MM-DD HH:MM` (ou `YYYY-MM-DD` sans heure), à partir de la date du jour. Ne jamais passer « demain » ou « lundi » tel quel à la commande.
3. Me montrer la liste en tableau (titre, échéance, notes) et attendre mon accord avant de créer quoi que ce soit.
4. Créer chaque rappel :

   ```bash
   reminders add RF "<titre>" --due-date "<date>" --notes "<notes>"
   ```

   Sans échéance ou sans notes, omettre l'option.
5. Vérifier avec `reminders show RF --sort creation-date` puis me dire ce qui a été créé.

## Autres commandes

- Voir la liste : `reminders show RF`
- Marquer fait : `reminders complete RF <index>` (index lu dans `show`)
- Supprimer : `reminders delete RF <index>`, seulement si je le demande
