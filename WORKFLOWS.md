# Agent Operational Workflows

Agents working on this repository MUST use these exact verification and quality commands.

## Verification & Quality Gates
- Shell Script Linting: `shellcheck setup-agent-docs.sh`
- Format Check: `shfmt -d -i 2 -ci setup-agent-docs.sh` (or apply fixes with `shfmt -w -i 2 -ci setup-agent-docs.sh`)
- Syntax Validation: `bash -n setup-agent-docs.sh`
- End-to-End Test Suite: `bash tests/test-scaffold.sh`

## Local Development & Testing
- Test in a clean temporary git repo:
  ```bash
  TMP_DIR=$(mktemp -d) && git -C "$TMP_DIR" init && cp setup-agent-docs.sh "$TMP_DIR/" && (cd "$TMP_DIR" && ./setup-agent-docs.sh) && rm -rf "$TMP_DIR"
  ```
- Check broken symlinks in repo:
  ```bash
  find . -xtype l
  ```
