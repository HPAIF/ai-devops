# Monitoring and alerting

> Written by `monitoring`. What is watched, what "good" means, who gets woken up and which
> runbook they follow.

## Service level objectives
> SLI = what is measured · SLO = the target over a window · error budget = 100% − SLO.

| Product / service | SLI (what, how measured) | SLO (target, window) | Error budget | Current (date) | Source |
|---|---|---|---|---|---|

## Golden signals per service
| Service | Latency | Traffic | Errors | Saturation | Where to see it |
|---|---|---|---|---|---|

## Alerts
| Alert | Condition | Severity | Notifies (channel, person) | Runbook | Last fired | Tested on |
|---|---|---|---|---|---|---|

## Other checks
| Check | Tool | Frequency | Notifies | Notes |
|---|---|---|---|---|
| Uptime (external) | | | | |
| Certificate / domain expiry | | | | |
| Backup success | | | | |
| Error tracking | | | | |

## On-call and status
- **Who responds:** ? (founder / engineer / contractor) · hours: ?
- **Status page:** ? · **Customer communication owner:** ?
