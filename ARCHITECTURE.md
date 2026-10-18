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
