# setup-agent-docs

A lightweight, tool-agnostic context scaffolding script for AI-assisted engineering and autonomous agent loops.

It bootstraps a unified structure (`AGENTS.md`, `ARCHITECTURE.md`, `CONVENTIONS.md`, `WORKFLOWS.md`, and `MEMORY.md`) while wiring native symlinks for **Google Antigravity**, **Claude Code**, **GitHub Copilot**, **Cursor**, **Windsurf**, and **Kiro**.

---

## Philosophy

### 1. In-Context Learning via Agent Loops
Large Language Models are stateless by default. Giving them a productive runtime requires two feedback loops:
* **Inner Loop (Autonomous Verification):** The agent writes code, inspects `WORKFLOWS.md`, executes tests/linters, captures tracebacks, and self-heals before requesting review.
* **Outer Loop (Persistent Retrospectives):** Non-obvious failures, race conditions, and architectural boundaries are recorded as single-line lessons in `MEMORY.md`, preventing future sessions from repeating past mistakes.

### 2. Strict Token Governance
Unchecked context files quickly exhaust token windows and degrade model attention. This repository enforces:
* A strict **100-line budget** on `MEMORY.md`[cite: 3, 4].
* Compaction workflows (`.agents/workflows/compact-memory.md`) to graduate mature patterns into `CONVENTIONS.md` or modular domain memory files under `.agents/memory/`[cite: 3, 4].

### 3. Dogfooding
This repository is self-hosted: the root files (`AGENTS.md`, `ARCHITECTURE.md`, `MEMORY.md`, etc.) are generated and maintained by `setup-agent-docs.sh` itself[cite: 3, 4]. It serves as a living proof of concept across different agent tools.

---

## File Structure

```text
.
├── AGENTS.md                  # Behavioral standards, defensive posture, and loop rules
├── ARCHITECTURE.md            # System overview, non-negotiable invariants, and data boundaries
├── CONVENTIONS.md             # Code style, error handling, and testing standards
├── WORKFLOWS.md               # Standardized test, lint, and build execution commands
├── MEMORY.md                  # Compact runtime memory (max 100 lines)
├── .agents/
│   ├── memory/                # Domain-specific long-term memory (database, infra)
│   └── workflows/             # Maintenance playbooks (e.g., compact-memory.md)
├── CLAUDE.md                  # Symlink -> AGENTS.md (Claude Code)
├── .github/
│   └── copilot-instructions.md# Symlink -> ../AGENTS.md (GitHub Copilot)
├── .antigravity/
│   └── rules.md               # Symlink -> ../AGENTS.md (Google Antigravity)
└── .cursorrules               # Symlink -> AGENTS.md (Cursor / Windsurf / Kiro)
