#!/bin/bash
# Skills Installation Script
# Reads from skills.txt and installs skills from skills.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_FILE="$SCRIPT_DIR/../skills.txt"

echo "Installing skills from skills.sh..."
echo "Reading from: $SKILLS_FILE"
echo ""

if [ ! -f "$SKILLS_FILE" ]; then
    echo "Error: skills.txt not found"
    exit 1
fi

# Check if npx is available
if ! command -v npx &> /dev/null; then
    echo "Error: npx not found. Install Node.js first."
    exit 1
fi

# Read skills from file and install each
while IFS= read -r skill || [ -n "$skill" ]; do
    # Skip empty lines and comments
    [[ -z "$skill" || "$skill" =~ ^# ]] && continue
    
    echo "Installing $skill..."
    npx skills add "$skill" 2>/dev/null || echo "  (may already be installed)"
done < "$SKILLS_FILE"

echo ""
echo "Done! Installed skills from skills.txt"
