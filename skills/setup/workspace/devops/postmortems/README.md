# Postmortems

One blameless postmortem per significant incident: `PM-XXXX-short-slug.md`, from the plugin's
`templates/postmortem.md` (skill `incident`). Write one for every SEV1 and SEV2, any data loss,
any security event, and any incident the founder asks about.

Blameless: describe systems, signals, decisions and contributing factors — never blame a person.
Every action item gets an owner, a due date and a row in `history/obligations.md`.

During an incident the running timeline is kept here as `INC-XXXX-timeline.md` (facts only:
timestamps, what was seen, what was done, approvals); the postmortem builds on it.
