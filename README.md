# Quieto Skills

[Claude Code](https://claude.ai/code) skills for the [Quieto Tokens](https://github.com/dillonschultz93/quieto-tokens) design token CLI. Each skill wraps a CLI command into a conversational workflow invocable via slash command.

## Available Skills

| Skill | Command | What it does |
|---|---|---|
| **design-token-init** | `/design-token-init` | Scaffold a new token system interactively |
| **design-token-audit** | `/design-token-audit` | Health-check: orphans, broken refs, naming, WCAG contrast |
| **design-token-migrate** | `/design-token-migrate` | Scan stylesheets for hardcoded values and replace with tokens |
| **design-token-component** | `/design-token-component` | Generate tier-3 component tokens (button, card, etc.) |
| **design-token-category-add** | `/design-token-category-add` | Add shadow, border, or animation categories |
| **design-token-contrast** | `/design-token-contrast` | Ad-hoc or system-wide WCAG contrast checking |
| **design-token-update** | `/design-token-update` | Modify inputs (brand color, spacing, etc.) with diff preview |

## Installation

### Standalone

Copy the skill directories into your project's `.claude/skills/` directory:

```bash
cp -r design-token-* /path/to/your/project/.claude/skills/
```

### As a git subtree (recommended)

Use the included sync script to add, pull, and push skills:

```bash
# Download the sync script
curl -sO https://raw.githubusercontent.com/dillonschultz93/quieto-skills/main/scripts/sync.sh
chmod +x sync.sh

# Add skills to your repo
./sync.sh add

# Pull latest updates
./sync.sh pull

# Push local edits back upstream
./sync.sh push

# Custom prefix (default: .claude/skills/quieto-skills)
./sync.sh add --prefix=.claude/skills/my-custom-path
```

Or run the git subtree commands directly:

```bash
git subtree add --prefix=.claude/skills/quieto-skills \
  git@github.com:dillonschultz93/quieto-skills.git main --squash

git subtree pull --prefix=.claude/skills/quieto-skills \
  git@github.com:dillonschultz93/quieto-skills.git main --squash

git subtree push --prefix=.claude/skills/quieto-skills \
  git@github.com:dillonschultz93/quieto-skills.git main
```

### From `quieto-tokens` repo

If you're working in the `quieto-tokens` repo, npm scripts are available:

```bash
npm run skills:pull   # Pull latest from quieto-skills
npm run skills:push   # Push local edits back to quieto-skills
```

## Prerequisites

These skills require [`@quieto/tokens`](https://www.npmjs.com/package/@quieto/tokens) to be installed in the target project:

```bash
npm install @quieto/tokens
```

## License

MIT
