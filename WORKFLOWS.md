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
