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
