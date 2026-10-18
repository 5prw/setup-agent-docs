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
* A strict **100-line budget** on `MEMORY.md`.
* Compaction workflows (`.agents/workflows/compact-memory.md`) to graduate mature patterns into `CONVENTIONS.md` or modular domain memory files under `.agents/memory/`.

### 3. Dogfooding
This repository is self-hosted: the root files (`AGENTS.md`, `ARCHITECTURE.md`, `MEMORY.md`, etc.) are generated and maintained by `setup-agent-docs.sh` itself. It serves as a living proof of concept across different agent tools.

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
```

---

## Quick Start

### Installation via Curl

Run this directly inside the root of your target Git repository:

```bash
curl -fsSL https://raw.githubusercontent.com/5prw/setup-agent-docs/main/setup-agent-docs.sh | bash
```

### Manual Usage

1. Clone or download the script:
   ```bash
   git clone https://github.com/5prw/setup-agent-docs.git
   cd your-project
   cp /path/to/setup-agent-docs/setup-agent-docs.sh .
   ```

2. Make it executable and run:
   ```bash
   chmod +x setup-agent-docs.sh
   ./setup-agent-docs.sh
   ```

3. Commit the generated structure:
   ```bash
   git add AGENTS.md ARCHITECTURE.md CONVENTIONS.md WORKFLOWS.md MEMORY.md .agents/ .github/ .antigravity/ .cursorrules CLAUDE.md
   git commit -m "chore(ai): bootstrap agent context infrastructure"
   ```

---

## Customization

After initialization:
1. Update `ARCHITECTURE.md` with your system invariants, dependencies, and core request lifecycles.
2. Adjust `WORKFLOWS.md` with your repository's actual build, test, and linting commands (e.g., `cargo test`, `go test ./...`, `npm run lint`).
3. Ensure agents update `MEMORY.md` whenever non-trivial edge cases are resolved.

