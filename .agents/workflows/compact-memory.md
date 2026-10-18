# Memory Consolidation & Compaction Workflow

When requested to clean up or compact memory, execute the following steps:
1. Read `MEMORY.md`.
2. Identify rules that are already enforced by automated tests or existing linters, and remove them.
3. Identify patterns that have matured into permanent architectural laws and move them to `CONVENTIONS.md` or `ARCHITECTURE.md`.
4. Move domain-heavy rules into dedicated files inside `.agents/memory/`.
5. Rewrite the remaining items in `MEMORY.md` as one-line bullet points, ensuring the file stays well under 100 lines.
