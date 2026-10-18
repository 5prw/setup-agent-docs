#!/usr/bin/env bash
# ==============================================================================
# setup-agent-docs.sh (v3 - Enterprise & Multi-Agent Edition)
# ------------------------------------------------------------------------------
# Initializes agnostic context infrastructure for agent-driven software
# engineering (Antigravity, Claude Code, GitHub Copilot, Kiro, Cursor, Windsurf).
# ==============================================================================

set -euo pipefail

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT_DIR"

echo "================================================================================"
echo "Configuring Agnostic Agent Context Infrastructure in: $ROOT_DIR"
echo "================================================================================"

safe_create_file() {
  local filepath="$1"
  local description="$2"
  if [ ! -f "$filepath" ]; then
    cat > "$filepath"
    echo "  [CREATED] $filepath ($description)"
  else
    echo "  [SKIPPED] $filepath (already exists)"
    cat > /dev/null
  fi
}

# 1. AGENTS.md
safe_create_file "AGENTS.md" "Engineering standards and agent behavior guidelines" << 'EOF'
# Agent Directives & Engineering Standards

## 1. Role & Engineering Mindset
- Act as a Principal Software Engineer and Staff Code Reviewer.
- Prioritize architectural integrity, defensive correctness, resilience, and maintainability over superficial brevity.
- Never write purely happy-path implementations. Actively anticipate and safeguard against subtle failure modes: race conditions, concurrency bottlenecks, memory/connection leaks, idempotency gaps, network timeouts, and boundary anomalies.

## 2. Scope & Design Interventions
- Treat initial user prompts as functional requirements, not immutable implementation specs.
- If a requested approach introduces design debt, performance degradation, breaking contract violations, or security risks, intervene early and propose a superior architectural alternative before writing code.
- Always check existing project patterns and contracts before adding new external dependencies or unnecessary abstractions.

## 3. Autonomous Execution & Verification Loop (Inner Loop)
- Execution Discipline: After implementing code changes, execute the relevant verification commands specified in `WORKFLOWS.md`.
- Self-Healing: If compilation, linting, type-checking, or tests fail, analyze tracebacks autonomously, resolve root causes, and re-run checks.
- Never declare a task complete while verification commands report errors or regressions.

## 4. Continuous Learning & Memory Governance (Outer Loop)
- Pre-Task Inspection: Before touching code, inspect `MEMORY.md` (and relevant domain files in `.agents/memory/`) for known historical pitfalls and domain-specific gotchas.
- Post-Task Reflection: If an unexpected bug, non-obvious failure mode, or critical edge case was resolved, record it in `MEMORY.md`.
- Strict Memory Budget:
  - Keep `MEMORY.md` under 100 lines total.
  - Do NOT write narratives, conversational logs, full stack traces, or raw code diffs.
  - Every entry must strictly follow: `[Domain/Package] Failure mode encountered -> Exact mitigation pattern applied.`
  - If `MEMORY.md` approaches 100 lines, trigger consolidation into `CONVENTIONS.md`, `ARCHITECTURE.md`, or domain-specific files under `.agents/memory/`.

## 5. Output & Communication
- Direct, dense, and technically grounded. Omit conversational filler, pleasantries, and trivial summaries.
- Focus technical explanations on *why* non-obvious trade-offs were chosen and which hidden failure modes were mitigated.
- Accompany all non-trivial bug fixes and new logic with automated unit/integration tests explicitly targeting the discovered edge cases.
EOF

# 2. ARCHITECTURE.md
safe_create_file "ARCHITECTURE.md" "Architectural contracts and non-negotiable boundaries" << 'EOF'
# System Architecture & Technical Context

## 1. Overview
Brief 2-3 sentence overview of the system domain, business objectives, and high-level stack.

## 2. System Invariants & Hard Boundaries (Non-Negotiable)
1. Layer Isolation: Domain logic must remain pure and never depend directly on presentation frameworks or database driver details.
2. Data Integrity: Zero hard deletes on core business entities; state transitions must be audited and idempotent.
3. Concurrency & State: Core API nodes must remain stateless; cross-process synchronization must rely on dedicated storage locks or message queues.

## 3. Data & Request Flow
- Request Entrypoint -> Router/Transport Handler -> Domain Service / Use Case -> Repository / Storage Adapter -> External Services.

## 4. Core Infrastructure & Dependencies
- Primary Storage: [e.g., PostgreSQL / SQLite with vector extensions]
- Message Broker / Event Bus: [e.g., Kafka / NATS / Redis Streams]
- Observability: [e.g., OpenTelemetry, structured logging with correlation IDs]
EOF

# 3. CONVENTIONS.md
safe_create_file "CONVENTIONS.md" "Implementation standards and code style" << 'EOF'
# Code Style & Implementation Conventions

## 1. General Principles
- Strictly adhere to idiomatic paradigms of the primary language.
- Explicit is better than implicit: avoid hidden side-effects, mutable globals, and magical reflection where possible.
- Handle all errors explicitly at the call site; never swallow exceptions or ignore return errors.

## 2. Naming & Organization
- Files & Packages: Use consistent project naming (e.g., kebab-case or snake_case).
- Contracts & Interfaces: Define interfaces close to where they are consumed, not where they are implemented.

## 3. Testing Standards
- Test Pyramid: Emphasize fast, deterministic unit tests for core domain logic; integration tests for database and network boundaries.
- Determinism: Never rely on system time, network round-trips, or random seeds without dependency injection or hermetic fixtures.
EOF

# 4. WORKFLOWS.md
safe_create_file "WORKFLOWS.md" "Build, test, and verification commands for agents" << 'EOF'
# Agent Operational Workflows

Agents MUST use these exact commands when running autonomous verification steps.

## Verification & Quality Gates
- Run Unit Tests: `make test` || `npm test` || `go test ./...`
- Run Single Test: `npm test -- -t "TestName"` || `go test -run TestName ./...`
- Lint & Type Check: `make lint` || `npm run lint` || `golangci-lint run`
- Build / Compilation: `make build` || `tsc --noEmit` || `go build ./...`

## Local Environment & Migrations
- Start Dependencies: `docker compose up -d`
- Apply Migrations: `make migrate`
EOF

# 5. MEMORY.md
safe_create_file "MEMORY.md" "Compact persistent memory with strict line budget" << 'EOF'
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
EOF

# 6. Modular Structure (.agents/memory/ and workflows)
mkdir -p .agents/memory .agents/workflows

safe_create_file ".agents/memory/database.md" "Modular memory for database operations" << 'EOF'
# Database Specific Gotchas & Patterns

- Document transaction handling nuances, index considerations, and migration rules here.
EOF

safe_create_file ".agents/memory/infra.md" "Modular memory for infrastructure and networking" << 'EOF'
# Infrastructure & Deployment Gotchas

- Document container runtime limitations, gRPC timeout nuances, and Kubernetes lifecycle hooks here.
EOF

safe_create_file ".agents/workflows/compact-memory.md" "Playbook for memory cleanup and promotion" << 'EOF'
# Memory Consolidation & Compaction Workflow

When requested to clean up or compact memory, execute the following steps:
1. Read `MEMORY.md`.
2. Identify rules that are already enforced by automated tests or existing linters, and remove them.
3. Identify patterns that have matured into permanent architectural laws and move them to `CONVENTIONS.md` or `ARCHITECTURE.md`.
4. Move domain-heavy rules into dedicated files inside `.agents/memory/`.
5. Rewrite the remaining items in `MEMORY.md` as one-line bullet points, ensuring the file stays well under 100 lines.
EOF

# 7. Tool Symlinks
echo "Configuring integrations and relative symlinks..."

create_relative_symlink() {
  local target="$1"
  local link="$2"

  mkdir -p "$(dirname "$link")"
  if [ -L "$link" ] || [ -f "$link" ]; then
    rm -f "$link"
  fi
  ln -s "$target" "$link"
  echo "  [SYMLINK] $link -> $target"
}

create_relative_symlink "AGENTS.md" "CLAUDE.md"
create_relative_symlink "../AGENTS.md" ".github/copilot-instructions.md"
create_relative_symlink "../AGENTS.md" ".antigravity/rules.md"
create_relative_symlink "AGENTS.md" ".cursorrules"

echo ""
echo "================================================================================"
echo "Setup completed successfully."
echo "Ready for verification across Antigravity, Claude Code, Kiro, and Copilot."
echo "================================================================================"
