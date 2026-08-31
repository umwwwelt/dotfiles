#!/bin/sh
# Serveurs MCP de Claude Code, scope "user".
#
# Claude ne lit aucun fichier de conf déclaratif pour ce scope : tout vit dans
# ~/.claude.json, un fichier d'état non versionnable. Ce script est donc la
# source de vérité, rejoué par chezmoi dès que son contenu change.
# `claude mcp add-json` refuse d'écraser un serveur existant, d'où remove+add.

set -eu

command -v claude >/dev/null 2>&1 || exit 0

add() {
	claude mcp remove "$1" -s user >/dev/null 2>&1 || true
	claude mcp add-json -s user "$1" "$2" >/dev/null
}

add svelte '{"type":"http","url":"https://mcp.svelte.dev/mcp"}'
add context7 '{"type":"http","url":"https://mcp.context7.com/mcp","headers":{"CONTEXT7_API_KEY":"${CONTEXT7_API_KEY}"}}'

# Volontairement absents, déjà couverts nativement par Claude Code :
#   atlassian, gitlab -> connecteurs claude.ai (`claude mcp login <nom>`)
#   chrome            -> Claude in Chrome intégré
