#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./install.sh
  ./install.sh --project /path/to/project
  ./install.sh --help

Options:
  --project PATH  Install into PATH/.claude/skills/challenge-master
  --help          Show this help message

Default:
  Installs globally into ~/.claude/skills/challenge-master
USAGE
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.claude/skills/challenge-master"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)
      if [[ $# -lt 2 || -z "${2:-}" ]]; then
        echo "Error: --project requires a path" >&2
        exit 1
      fi
      TARGET_DIR="$2/.claude/skills/challenge-master"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Error: unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

mkdir -p "$TARGET_DIR"

for item in SKILL.md roles.md templates.md README.md examples; do
  if [[ ! -e "$SCRIPT_DIR/$item" ]]; then
    echo "Error: missing required file or directory: $item" >&2
    exit 1
  fi
done

cp "$SCRIPT_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"
cp "$SCRIPT_DIR/roles.md" "$TARGET_DIR/roles.md"
cp "$SCRIPT_DIR/templates.md" "$TARGET_DIR/templates.md"
cp "$SCRIPT_DIR/README.md" "$TARGET_DIR/README.md"
rm -rf "$TARGET_DIR/examples"
cp -R "$SCRIPT_DIR/examples" "$TARGET_DIR/examples"

cat <<EOF
Challenge Master installed to:
  $TARGET_DIR

Restart Claude Code, then try:
  来活儿了挑战大师：我想做一个用户分层功能
EOF
