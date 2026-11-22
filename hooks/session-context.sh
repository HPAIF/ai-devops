#!/bin/bash
# AI DevOps — SessionStart hook.
# Prints the DevOps engineer's memory for this project: date, company stage, overdue/upcoming
# obligations and renewals, last journal entries, open incidents and postmortems due,
# pending learnings, inbox, latest digest.
# Silent when the project has no ai-team/devops workspace.
set -u
# Find the nearest workspace: ai-team/devops in the project folder or any parent folder
# (a company folder can hold ai-team/ next to projects/<product>/).
dir="${CLAUDE_PROJECT_DIR:-$PWD}"
WS=""
while [ -n "$dir" ] && [ "$dir" != "/" ]; do
  if [ -d "$dir/ai-team/devops" ]; then WS="$dir/ai-team"; break; fi
  dir=$(dirname "$dir")
done
[ -n "$WS" ] || exit 0
ME="$WS/devops"
cd "$ME" || exit 0

version=$(grep -m1 '"version"' "${CLAUDE_PLUGIN_ROOT:-.}/.claude-plugin/plugin.json" 2>/dev/null | sed 's/.*"version": *"\([^"]*\)".*/\1/')
today=$(date +%F)
soon=$(date -v+30d +%F 2>/dev/null || date -d '+30 days' +%F)

echo "=== AI DEVOPS ${version:+v$version }— session context (${today}) ==="
echo "Rules: ${CLAUDE_PLUGIN_ROOT:-<plugin>}/RULES.md (agent ai-devops:devops). NO deploy, migration, deletion or infra change without the founder's explicit approval of that exact action. Never print secrets. Log every job (log-job)."
echo "Workspace: $WS  (every ai-team/... path in the rules and skills means this folder)"

stage=$(grep -m1 '^- \*\*Stage:\*\*' "$WS/company/profile.md" 2>/dev/null | sed 's/^- \*\*Stage:\*\* *//')
products=$(find "$WS/company/products" -name '*.md' ! -name '_template.md' 2>/dev/null | wc -l | tr -d ' ')
echo "Company stage: ${stage:-unknown} · Product files: ${products:-0}"
echo

echo "--- Ops obligations and renewals: overdue or due by ${soon} ---"
if [ -f history/obligations.md ]; then
  awk -F'|' -v today="$today" -v soon="$soon" '
    /^\| O-/ {
      id=$2; due=$3; type=$4; what=$5; status=$7
      gsub(/^ +| +$/, "", id); gsub(/^ +| +$/, "", due); gsub(/^ +| +$/, "", type)
      gsub(/^ +| +$/, "", what); gsub(/^ +| +$/, "", status)
      if (status == "open" && due ~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ && due <= soon) {
        flag = (due < today) ? "OVERDUE " : ""
        printf "%s%s  %s  [%s] %s\n", flag, id, due, type, what; n++
      }
      if (status == "open" && due == "—") u++
    }
    END { if (n == 0) print "(none)"; if (u > 0) printf "(+ %d open items without a date)\n", u }' history/obligations.md
fi
echo

echo "--- Open incidents and postmortems due ---"
if [ -f incidents.md ]; then
  awk -F'|' '
    /^\| INC-/ {
      id=$2; started=$3; sev=$4; prod=$5; summary=$6; status=$7; pm=$9
      gsub(/^ +| +$/, "", id); gsub(/^ +| +$/, "", started); gsub(/^ +| +$/, "", sev)
      gsub(/^ +| +$/, "", prod); gsub(/^ +| +$/, "", summary); gsub(/^ +| +$/, "", status)
      gsub(/^ +| +$/, "", pm)
      if (status != "closed") {
        printf "%s  %s  %s  [%s] %s — %s (postmortem: %s)\n", id, sev, started, prod, summary, status, pm; n++
      }
    }
    END { if (n == 0) print "(none)" }' incidents.md
fi
echo

echo "--- Last journal entries ---"
j=$(grep '^## J-' history/journal.md 2>/dev/null | tail -n 6)
echo "${j:-(none)}"
echo

pending=$(grep -c '^| L-[0-9]* .*| general .*| pending' learnings.md 2>/dev/null || true)
inbox=$(find inbox -type f ! -name 'README.md' ! -name '.*' 2>/dev/null | wc -l | tr -d ' ')
latest=$(ls -1 digests/20*.md 2>/dev/null | tail -n 1)
echo "Inbox: ${inbox:-0} file(s) · Pending general learnings: ${pending:-0}$( [ "${pending:-0}" -ge 3 ] && echo ' → suggest ai-devops:improve') · Latest digest: ${latest:-none yet}"
exit 0
