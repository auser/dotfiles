#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting dotfiles installation...${NC}"

# Check if chezmoi is installed
if ! command -v chezmoi &> /dev/null; then
    echo -e "${YELLOW}Chezmoi not found. Installing...${NC}"
    sh -c "$(curl -fsLS get.chezmoi.io)"
    # Add chezmoi to PATH for the current session
    export PATH="$HOME/.local/bin:$PATH"
fi

echo -e "${GREEN}Chezmoi is installed!${NC}"

# Initialize and apply dotfiles
echo -e "${BLUE}Initializing dotfiles repository...${NC}"
chezmoi init --apply auser

echo -e "${GREEN}Dotfiles successfully installed!${NC}"
echo -e "${YELLOW}Note: You may need to restart your shell for all changes to take effect.${NC}" 