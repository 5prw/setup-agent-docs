# Project Agent Memory & Lessons Learned

> **GOVERNANCE RULE FOR AGENTS:**
> - Keep this file under 100 lines.
> - Format: `[Domain/Module] Failure mode -> Mitigation applied.`
> - Expire or promote consolidated rules into `CONVENTIONS.md` or `.agents/memory/`.

## Active Lessons & Discovered Edge Cases
- [Template] `[Auth] Token validation requires clock skew tolerance of 5s to avoid race conditions during node synchronization.`
- [Template] `[Database] High-frequency balance mutations require row-level locking (SELECT FOR UPDATE) to prevent concurrency anomalies.`

## Promoted or Archived Milestones
- Initial agent infrastructure established.
