#!/bin/bash
# Initialize a new OpenClaw skill from template

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/../template"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <skill-name> <skill-description>"
    echo ""
    echo "Example:"
    echo "  $0 weather-skill 'Get weather forecasts via wttr.in'"
    exit 1
fi

SKILL_NAME="$1"
SKILL_DESCRIPTION="$2"
SKILL_NAME_UPPER=$(echo "$SKILL_NAME" | tr '[:lower:]' '[:upper:]' | tr '-' '_')
TARGET_DIR="$SCRIPT_DIR/../$SKILL_NAME"

# Check if target already exists
if [ -d "$TARGET_DIR" ]; then
    log_error "Directory already exists: $TARGET_DIR"
    exit 1
fi

log_info "Creating skill: $SKILL_NAME"
log_info "Description: $SKILL_DESCRIPTION"

# Copy template
cp -r "$TEMPLATE_DIR" "$TARGET_DIR"

# Replace placeholders
find "$TARGET_DIR" -type f \( -name "*.sh" -o -name "*.md" \) | while read -r file; do
    sed -i "s/{{SKILL_NAME}}/$SKILL_NAME/g" "$file"
    sed -i "s/{{SKILL_DESCRIPTION}}/$SKILL_DESCRIPTION/g" "$file"
    sed -i "s/{{skill-name}}/$SKILL_NAME/g" "$file"
    sed -i "s/{{AUTHOR}}/$(git config user.name 2>/dev/null || echo 'Your Name')/g" "$file"
done

# Make scripts executable
chmod +x "$TARGET_DIR/scripts/"*.sh 2>/dev/null || true

log_success "Skill created: $TARGET_DIR"
echo ""
echo "Next steps:"
echo "  1. cd $TARGET_DIR"
echo "  2. Edit scripts/main.sh with your logic"
echo "  3. Update SKILL.md with detailed usage"
echo "  4. Test: ./scripts/main.sh --help"
echo "  5. Publish when ready!"
