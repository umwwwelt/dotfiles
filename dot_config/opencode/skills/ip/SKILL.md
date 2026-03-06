---
name: update-ip-whitelist
description: Use when you must update a single public IP entry in git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git based on an email and curl ifconfig.me output
---

# Update IP Whitelist

## Overview
Update a single whitelist line in `kapitan/inventory/classes/common/whitelistprofile.yml` with a fresh public IP while preserving the existing comment suffix, using explicit confirmations before commit and push.

## When to Use
Use this skill when you need to update a single user IP entry in the whitelist YAML based on their email address and the current public IP from `curl -4 ifconfig.me`, and the change must be made only in `git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git`.

Before starting, confirm the email matches the exact line format and that you will base the branch on `origin/master`.

Do NOT use this skill if:
- The repo is not `git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git`
- The whitelist entry format differs from the required pattern
- You need to update multiple emails in one run

## Core Pattern

### Required format
The target line must always match:
```
"<ip>/32" # <email> (<previous-label>)
```
Only replace the IP value. Preserve the parenthesized label verbatim.

### Workflow
1. Verify current repo matches `git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git`.
2. If `git remote -v` returns nothing or no `origin`, stop and respond only with: `This skill requires git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git`.
3. Fetch latest from origin.
4. Ask for the email to update.
5. Create a new branch from `origin/master`.
6. Run `curl -4 ifconfig.me` and capture the IP.
7. Open `kapitan/inventory/classes/common/whitelistprofile.yml` and locate the line with the email.
8. Replace the IP in that line only, keeping the parenthesized label unchanged.
9. Show the old line, new line, and commit message; ask for confirmation to commit.
10. Commit with: `whitelist: update IP <email>`.
11. Ask for confirmation before pushing.

### Repo gate snippet
```bash
git remote -v
```
Stop if the remote does not contain `git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git` or if `git remote -v` is empty; respond only with: `This skill requires git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git`.

### Fetch snippet
```bash
git fetch origin
```

## Quick Reference
- Repo gate: `git remote -v` contains `git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git` and `origin` exists (otherwise respond only: `This skill requires git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git`)
- Branch: create from `origin/master`
- File: `kapitan/inventory/classes/common/whitelistprofile.yml`
- IP source: `curl -4 ifconfig.me`
- Line format: `"<ip>/32" # <email> (<label>)`
- Commit: `whitelist: update IP <email>`

## Example
Old line:
```
"86.246.23.146/32" # eric.bellemon@radiofrance.com (Cruiser)
```
New line:
```
"203.0.113.4/32" # eric.bellemon@radiofrance.com (Cruiser)
```
Commit message:
```
whitelist: update IP eric.bellemon@radiofrance.com
```

## Common Mistakes
- Skipping the repo check and editing the wrong repository (respond only: `This skill requires git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git`)
- Replacing the parenthesized label or removing the comment
- Committing without showing a diff and getting user confirmation
- Pushing without explicit confirmation

## Red Flags - STOP
- Repo is not the expected Git remote or `origin` missing (respond only: `This skill requires git@gitlab.dnm.radiofrance.fr:struktur/kubernetes.git`)
- Email line not found
- Email appears multiple times
- IP not in `/32` format
- User did not confirm commit or push
- Attempting to update without starting from `origin/master`

## Rationalizations to Avoid
| Excuse | Reality |
| --- | --- |
| "I can update a similar repo" | Repo scope is strict; stop if it doesn't match |
| "The comment can be edited" | Preserve the parenthesized label exactly |
| "I'll commit then show the change" | Confirmation must come before commit |
| "Pushing is part of the flow" | Push requires explicit user confirmation |
| "The email is close enough" | Match the exact line for the requested email |
