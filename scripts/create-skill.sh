#!/usr/bin/env bash
#
# Create a new OpenClaw skill from template
#
# Usage: ./create-skill.sh <skill-name>
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATE_DIR="${PROJECT_DIR}/template"

if [ $# -lt 1 ]; then
    echo "Usage: $0 <skill-name>"
    echo "Example: $0 weather-check"
    exit 1
fi

SKILL_NAME="$1"
SKILL_DIR="${SKILL_NAME}"

# Validate skill name (alphanumeric and hyphens only)
if ! [[ "$SKILL_NAME" =~ ^[a-z0-9-]+$ ]]; then
    echo "Error: Skill name must contain only lowercase letters, numbers, and hyphens"
    exit 1
fi

# Check if directory already exists
if [ -d "$SKILL_DIR" ]; then
    echo "Error: Directory '$SKILL_DIR' already exists"
    exit 1
fi

echo "Creating skill: $SKILL_NAME"

# Create directory structure
mkdir -p "$SKILL_DIR/scripts"
mkdir -p "$SKILL_DIR/examples"
mkdir -p "$SKILL_DIR/logs"

# Copy template files
cp "${TEMPLATE_DIR}/SKILL.md" "$SKILL_DIR/"
cp "${TEMPLATE_DIR}/scripts/main.sh" "$SKILL_DIR/scripts/"

# Customize SKILL.md
sed -i "s/\[Your Skill Name\]/${SKILL_NAME}/g" "$SKILL_DIR/SKILL.md"
sed -i "s/\[skill-name\]/${SKILL_NAME}/g" "$SKILL_DIR/SKILL.md"

# Customize main.sh
sed -i "s/\[Skill Name\]/${SKILL_NAME}/g" "$SKILL_DIR/scripts/main.sh"
sed -i "s/\[skill-name\]/${SKILL_NAME}/g" "$SKILL_DIR/scripts/main.sh"

# Make script executable
chmod +x "$SKILL_DIR/scripts/main.sh"

# Create example usage file
cat > "$SKILL_DIR/examples/usage.md" << EOF
# ${SKILL_NAME} - Usage Examples

## Basic Usage

\`\`\`bash
openclaw run ${SKILL_NAME}
\`\`\`

## With Arguments

\`\`\`bash
openclaw run ${SKILL_NAME} --option value
\`\`\`

## Configuration

Add to your TOOLS.md:

\`\`\`markdown
### ${SKILL_NAME}

- Your setting: value
\`\`\`

EOF

# Create README for the skill
cat > "$SKILL_DIR/README.md" << EOF
# ${SKILL_NAME}

[Add a description of what this skill does]

## Installation

\`\`\`bash
# If installing from ClawHub:
openclaw skill install ${SKILL_NAME}

# Or symlink locally:
ln -s \$(pwd)/${SKILL_NAME} ~/.openclaw/workspace/skills-installed/
\`\`\`

## Usage

\`\`\`bash
openclaw run ${SKILL_NAME} [arguments]
\`\`\`

## Configuration

See SKILL.md for configuration options.

## Development

\`\`\`bash
cd ${SKILL_NAME}
./scripts/main.sh
\`\`\`

EOF

echo ""
echo "✅ Skill '$SKILL_NAME' created successfully!"
echo ""
echo "Next steps:"
echo "  1. cd $SKILL_DIR"
echo "  2. Edit SKILL.md with your skill's purpose"
echo "  3. Edit scripts/main.sh with your logic"
echo "  4. Test with: openclaw run $SKILL_NAME"
echo ""
