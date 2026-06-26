#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./install.sh
  ./install.sh --claude
  ./install.sh --codex
  ./install.sh --claw
  ./install.sh --project /path/to/project
  ./install.sh --target /custom/skills/challenge-master
  ./install.sh --help

Options:
  --claude       Install globally for Claude Code: ~/.claude/skills/challenge-master
  --codex        Install globally for Codex/Agents-style clients: ~/.agents/skills/challenge-master
  --claw         Install globally for Claw: ~/.claw/skills/challenge-master
  --project PATH Install into PATH/.claude/skills/challenge-master
  --target PATH  Install into a custom target directory
  --help         Show this help message

Default:
  Same as --claude
USAGE
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.claude/skills/challenge-master"
PLATFORM="Claude Code"
TARGET_SET=false

set_target() {
  if [[ "$TARGET_SET" == true ]]; then
    echo "Error: choose only one install target" >&2
    usage >&2
    exit 1
  fi
  TARGET_DIR="$1"
  PLATFORM="$2"
  TARGET_SET=true
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --claude)
      set_target "$HOME/.claude/skills/challenge-master" "Claude Code"
      shift
      ;;
    --codex)
      set_target "$HOME/.agents/skills/challenge-master" "Codex / Agents"
      shift
      ;;
    --claw)
      set_target "$HOME/.claw/skills/challenge-master" "Claw"
      shift
      ;;
    --project)
      if [[ $# -lt 2 || -z "${2:-}" ]]; then
        echo "Error: --project requires a path" >&2
        exit 1
      fi
      if [[ ! -d "$2" ]]; then
        echo "Error: --project path does not exist: $2" >&2
        exit 1
      fi
      set_target "$2/.claude/skills/challenge-master" "Claude Code project-local"
      shift 2
      ;;
    --target)
      if [[ $# -lt 2 || -z "${2:-}" ]]; then
        echo "Error: --target requires a path" >&2
        exit 1
      fi
      set_target "$2" "custom target"
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

if [[ -z "$TARGET_DIR" || "$TARGET_DIR" == "/" || "$TARGET_DIR" != *"challenge-master"* ]]; then
  echo "Error: invalid target directory: $TARGET_DIR" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"

for item in SKILL.md roles.md templates.md README.md CHANGELOG.md CONTRIBUTING.md install.sh examples; do
  if [[ ! -e "$SCRIPT_DIR/$item" ]]; then
    echo "Error: missing required file or directory: $item" >&2
    exit 1
  fi
done

tmp_examples="$TARGET_DIR/examples.tmp.$$"
rm -rf "$tmp_examples"
cp -R "$SCRIPT_DIR/examples" "$tmp_examples"

cp "$SCRIPT_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"
cp "$SCRIPT_DIR/roles.md" "$TARGET_DIR/roles.md"
cp "$SCRIPT_DIR/templates.md" "$TARGET_DIR/templates.md"
cp "$SCRIPT_DIR/README.md" "$TARGET_DIR/README.md"
cp "$SCRIPT_DIR/CHANGELOG.md" "$TARGET_DIR/CHANGELOG.md"
cp "$SCRIPT_DIR/CONTRIBUTING.md" "$TARGET_DIR/CONTRIBUTING.md"
cp "$SCRIPT_DIR/install.sh" "$TARGET_DIR/install.sh"
rm -rf "$TARGET_DIR/examples"
mv "$tmp_examples" "$TARGET_DIR/examples"

cat <<EOF
Challenge Master installed for $PLATFORM:
  $TARGET_DIR

Restart your agent client, then try:
  来活儿了挑战大师：我想做一个用户分层功能
EOF
