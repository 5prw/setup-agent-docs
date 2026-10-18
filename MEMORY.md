# Project Agent Memory & Lessons Learned

> **GOVERNANCE RULE FOR AGENTS:**
> - Keep this file under 100 lines.
> - Format: `[Domain/Module] Failure mode -> Mitigation applied.`
> - Expire or promote consolidated rules into `CONVENTIONS.md` or `.agents/memory/`.

## Active Lessons & Discovered Edge Cases
- [Bash/Symlinks] Nested symlinks (like `.antigravity/rules.md`) must point to `../AGENTS.md` relatively, never `AGENTS.md` directly, otherwise they break upon clone.
- [POSIX/Git] When testing without git, `git rev-parse --show-toplevel` fails; always fallback to `pwd` with `|| pwd`.
- [Idempotency] Never use `cat > file` without checking `[ ! -f file ]` first, ensuring user edits are preserved on rerun.

## Promoted or Archived Milestones
- Initial scaffold script and dogfooding repository established.
