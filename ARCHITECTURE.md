# System Architecture & Technical Context

## 1. Overview
`setup-agent-docs` is a zero-dependency, tool-agnostic POSIX/Bash automation utility. Its sole responsibility is scaffolding structured AI agent governance documents (`AGENTS.md`, `ARCHITECTURE.md`, `CONVENTIONS.md`, `WORKFLOWS.md`, `MEMORY.md`) and setting up deterministic symlinks for various coding agent harnesses (Claude Code, Google Antigravity, GitHub Copilot, Cursor, Windsurf, Kiro).

## 2. System Invariants & Hard Boundaries (Non-Negotiable)
1. Zero Runtime Dependencies: The tool must only require standard POSIX utilities, modern Bash (>= 4.0), and Git. No external binaries, Python, or Node runtimes required to scaffold.
2. Strict Idempotency: Running the script multiple times on the same workspace must never overwrite existing human modifications or corrupt existing configs.
3. Relative Symlink Integrity: All created symlinks must use relative targets (e.g. `../AGENTS.md` instead of absolute filesystem paths) to guarantee portability across Git clones, Docker containers, WSL, and different OS environments.
4. Non-Destructive Memory: The initialization process must never blank out an existing `MEMORY.md`.

## 3. Data & Execution Flow
- Invocation Entrypoint (`setup-agent-docs.sh`)
  -> Detect repository root via `git rev-parse --show-toplevel` (fallback to `pwd`)
  -> Verify/safely initialize core documents with safe checks
  -> Create directory tree (`.agents/memory/`, `.agents/workflows/`)
  -> Create relative symlinks for supported AI harnesses (`CLAUDE.md`, `.antigravity/rules.md`, etc.)
  -> Print deterministic status report and exit cleanly.

## 4. Supported Tool Bridges
- Claude Code: `CLAUDE.md` -> `AGENTS.md`
- Google Antigravity: `.antigravity/rules.md` -> `../AGENTS.md`
- GitHub Copilot: `.github/copilot-instructions.md` -> `../AGENTS.md`
- Cursor / Windsurf / Kiro: `.cursorrules` -> `AGENTS.md`
