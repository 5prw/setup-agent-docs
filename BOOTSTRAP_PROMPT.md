# Bootstrap & Align Project Context Prompt

Use this prompt with your AI coding agent (Antigravity, Claude Code, GitHub Copilot, Kiro, Cursor, etc.) immediately after executing `setup-agent-docs.sh` to tailor the newly scaffolded templates to this codebase—whether this is a brand-new repository or an established, legacy project.

---

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
