#!/usr/bin/env bash
set -euo pipefail

REMOTE="git@github.com:dillonschultz93/quieto-skills.git"
BRANCH="main"

usage() {
  echo "Usage: $0 <command> [--prefix=<path>]"
  echo ""
  echo "Commands:"
  echo "  add     Add quieto-skills as a subtree to your repo"
  echo "  pull    Pull latest skills from the upstream repo"
  echo "  push    Push local skill edits back to the upstream repo"
  echo ""
  echo "Options:"
  echo "  --prefix=<path>  Subtree prefix (default: .claude/skills/quieto-skills)"
}

PREFIX=".claude/skills/quieto-skills"

for arg in "$@"; do
  case "$arg" in
    --prefix=*) PREFIX="${arg#*=}" ;;
  esac
done

COMMAND="${1:-}"

case "$COMMAND" in
  add)
    echo "Adding quieto-skills subtree at $PREFIX..."
    git subtree add --prefix="$PREFIX" "$REMOTE" "$BRANCH" --squash
    echo "Done. Skills are now at $PREFIX/"
    ;;
  pull)
    echo "Pulling latest skills into $PREFIX..."
    git subtree pull --prefix="$PREFIX" "$REMOTE" "$BRANCH" --squash
    echo "Done."
    ;;
  push)
    echo "Pushing local changes from $PREFIX back to quieto-skills..."
    git subtree push --prefix="$PREFIX" "$REMOTE" "$BRANCH"
    echo "Done."
    ;;
  *)
    usage
    exit 1
    ;;
esac
