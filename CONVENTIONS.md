# Code Style & Implementation Conventions

## 1. General Principles
- Strictly adhere to Bash best practices (`set -euo pipefail`).
- Prefer standard POSIX coreutils (`mkdir`, `ln`, `cat`, `rm`, `find`) over distro-specific extensions.
- Always quote variables to prevent word splitting and globbing (`"$filepath"`, `"$target"`).
- Keep the script self-contained within a single executable shell file.

## 2. Naming & Organization
- Functions: `snake_case` (e.g., `safe_create_file`, `create_relative_symlink`).
- Global variables: `UPPER_SNAKE_CASE` (e.g., `ROOT_DIR`).
- Local variables: `local var_name` inside function scopes.

## 3. Error Handling & Defense
- Fail immediately on unhandled errors, unset variables, or failed pipeline stages (`set -euo pipefail`).
- When creating symlinks, ensure the parent directory exists first (`mkdir -p "$(dirname "$link")"`).
- Clean up existing symlinks or stale files before invoking `ln -s` to prevent recursive link creation.
