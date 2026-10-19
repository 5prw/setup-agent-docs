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
│   └── workflows/             # Maintenance playbooks (e.g., compact-memory.md, bootstrap-context.md)
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

Run this directly inside the root of your target Git repository (works for both brand-new and established codebases):

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

## Post-Setup: Tailoring to Your Codebase

Right after running `setup-agent-docs.sh` in a new or pre-existing project, prompt your AI agent (Antigravity, Claude Code, Cursor, Copilot, Kiro) with the prompt below to automatically survey the codebase and replace all placeholders with actual project rules:

```text
Act as a Principal Software Engineer and System Architect.

I have executed `setup-agent-docs.sh` in this workspace. The root directory now contains template governance files: `ARCHITECTURE.md`, `CONVENTIONS.md`, `WORKFLOWS.md`, and `MEMORY.md`.

Your objective is to inspect this codebase and customize each of these files to accurately reflect the real architecture, system boundaries, established conventions, and operational workflows of this project (whether new or pre-existing).

Execute these tasks in order:

1. Repository Reconnaissance:
   - Identify the primary languages, runtimes, package managers, and core frameworks in use.
   - Inspect build scripts, Makefiles, Dockerfiles, package manifests (package.json, go.mod, Cargo.toml, pyproject.toml, pom.xml, etc.), and CI/CD pipelines (.github/workflows).
   - Identify existing test runners, linters, formatters, database migration tools, and scripts.

2. Tailor ARCHITECTURE.md:
   - Summarize the business/technical purpose and architectural pattern (clean architecture, modular monolith, microservice, event-driven, CLI tool, etc.).
   - Define concrete system invariants and hard isolation boundaries relevant to this project.
   - Map the actual request/data lifecycle (entry points, handlers/services, persistence layer, external integrations).

3. Tailor WORKFLOWS.md:
   - Replace all placeholder commands with the exact commands used in this repository for:
     * Running the test suite (all tests vs. single targeted test).
     * Linting and static analysis.
     * Formatting and compilation / type-checking.
     * Starting local dependencies and running migrations.

4. Tailor CONVENTIONS.md:
   - Document the real naming conventions, file layout, and package structure already practiced in the codebase.
   - Outline strict project-specific error handling, logging, and concurrency patterns.
   - Detail unit and integration testing patterns adopted by existing tests.

5. Update MEMORY.md:
   - Clear generic template examples and initialize the active lessons section with any critical quirks, environment variable constraints, or gotchas discovered during your reconnaissance.
   - Maintain the strict 100-line limit and the format: `[Domain/Module] Failure mode -> Mitigation applied.`

Rules of Engagement:
- Do NOT modify `AGENTS.md` (keep general behavioral directives intact).
- Do NOT alter or break existing relative symlinks (`CLAUDE.md`, `.antigravity/rules.md`, `.cursorrules`, etc.).
- Be terse, concrete, and eliminate placeholder text.
- Present a concise diff/summary of the changes made to each file once finished.
```

---

## License

MIT
