# Incident register

> Every incident (unplanned degradation or outage, data problem, security event affecting
> service). Written by `incident` and `log-job`. Never delete a row; update status and dates.
> The session hook lists every row whose status is not `closed`, so keep the column order.
>
> - **Severity:** SEV1 (critical: product down or data at risk for many users) · SEV2 (major:
>   key feature broken or many users affected) · SEV3 (minor: degraded, workaround exists) ·
>   SEV4 (low: cosmetic or internal). When unsure, start higher.
> - **Status:** investigating → mitigated → resolved → closed (closed = postmortem done or
>   explicitly not needed).
> - **Postmortem:** `PM-XXXX` link · `due YYYY-MM-DD` · `not needed (why)`.

| ID | Started | Severity | Product / service | Summary | Status | Resolved | Postmortem | Notes |
|---|---|---|---|---|---|---|---|---|
