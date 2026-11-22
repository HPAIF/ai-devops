# Runbooks

One file per alert or operational task: `RB-XXXX-short-slug.md`, from the plugin's
`templates/runbook.md`. Every alert in `monitoring.md` should link a runbook.

Runbooks describe diagnosis and fix steps. Steps that change production are marked
**[CHANGE — needs founder approval]**; following a runbook never replaces that approval.
Never put secret values in a runbook — say where the secret lives.
