#!/bin/bash
# Hello World - Example OpenClaw Skill

set -e

# Default name
NAME="${1:-World}"

# Output
echo "👋 Hello, $NAME!"
echo ""
echo "This is an example OpenClaw skill."
echo "Use this template to build your own skills!"
echo ""
echo "Skill structure:"
echo "  - SKILL.md: Skill metadata and description"
echo "  - scripts/: Your skill logic"
echo "  - docs/: Documentation"
echo "  - examples/: Usage examples"
