#!/bin/bash

# GitHub Profile Setup Script (Bash)
# Automates deployment of animated GitHub profile
# Usage: bash setup.sh

set -e  # Exit on error

GITHUB_USERNAME="${1:-tejaswin-amara}"
EMAIL="${2:-tejaswinamara@klh.edu.in}"
WORK_DIR="${3:-$HOME/Desktop/tejaswin-amara}"

# Color codes
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Functions
success() {
    echo -e "${GREEN}✅ $1${NC}"
}

info() {
    echo -e "${CYAN}ℹ️  $1${NC}"
}

warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

error() {
    echo -e "${RED}❌ $1${NC}"
}

clear
info "GitHub Profile Setup Script (Bash)"
info "===================================="
info ""

# Step 1: Check prerequisites
info "STEP 1: Checking prerequisites..."

if ! command -v git &> /dev/null; then
    error "Git not found. Please install Git first:"
    error "  macOS: brew install git"
    error "  Ubuntu: sudo apt-get install git"
    exit 1
fi
success "Git is installed"

# Step 2: Create working directory
info ""
info "STEP 2: Creating working directory..."
if [ -d "$WORK_DIR" ]; then
    warning "Directory already exists: $WORK_DIR"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$WORK_DIR"
        success "Directory cleared"
    else
        info "Using existing directory"
    fi
fi

mkdir -p "$WORK_DIR"
success "Created directory: $WORK_DIR"

# Step 3: Initialize Git repository
info ""
info "STEP 3: Initializing Git repository..."
cd "$WORK_DIR"

if [ -d .git ]; then
    info "Repository already exists"
else
    git init > /dev/null
    success "Initialized Git repository"
fi

# Step 4: Configure Git
info ""
info "STEP 4: Configuring Git..."
git config user.name "Tejaswin Amara" 2>/dev/null || true
git config user.email "$EMAIL" 2>/dev/null || true
success "Git configured (local scope)"

# Step 5: Create file structure
info ""
info "STEP 5: Creating file structure..."
mkdir -p .github/workflows assets
success "Directory structure created"

# Step 6: Create README.md
info ""
info "STEP 6: Creating README.md..."

cat > README.md << 'EOF'
<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0f172a,50:134e4a,100:14b8a6&height=200&section=header&text=Tejaswin%20Amara&fontSize=46&fontColor=e2e8f0&fontAlignY=35&animation=fadeIn&desc=Agents%2C%20audits%2C%20and%20campus%20tools.&descSize=18&descAlignY=58&descColor=94a3b8" width="100%" alt="header banner" />

<img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&size=20&duration=3000&pause=1000&color=14B8A6&center=true&vCenter=true&width=650&lines=Building+Sovereign-OS+%E2%80%94+an+AI+agent+governance+framework;Auditing+codebases+instead+of+trusting+the+changelog;Shipping+tools+for+KL+University%27s+ERP+and+attendance;Full-stack+development%2C+AI+tooling%2C+and+design" alt="Typing SVG" />

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/tejaswin-amara/)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/tejaswin-amara)
![Profile Views](https://komarev.com/ghpvc/?username=tejaswin-amara&color=14b8a6&style=for-the-badge&label=PROFILE+VIEWS)

</div>

$ whoami
Tejaswin Amara — B.Tech CS&IT (Y25), KL University, Hyderabad

## 🛠️ Currently building

- 🛡️ **[Sovereign-OS](https://github.com/tejaswin-amara/Sovereign-OS)** — AI agent governance framework
- 📶 **[KL Sync](https://github.com/tejaswin-amara/kl-sync)** — University ERP client
- 🎮 **[Quiz Platform](https://github.com/tejaswin-amara/Quiz-Platform)** — Real-time quiz app

## ⚡ Stack

![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white) ![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB) ![Next.js](https://img.shields.io/badge/Next.js-000000?style=for-the-badge&logo=next.js&logoColor=white) ![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white) ![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

## 📊 GitHub stats

<div align="center">

<img src="https://github-stats-extended.vercel.app/api?username=tejaswin-amara&show_icons=true&hide_border=true&bg_color=0f172a&title_color=14b8a6&text_color=e2e8f0&icon_color=14b8a6" width="49%" alt="GitHub stats" />

<img src="https://streak-stats.demolab.com/?user=tejaswin-amara&hide_border=true&background=0f172a&ring=14b8a6&fire=14b8a6&currStreakNum=e2e8f0&sideNums=e2e8f0&currStreakLabel=94a3b8&sideLabels=94a3b8&dates=64748b" width="70%" alt="GitHub streak" />

</div>

---

**Profile Setup**: Complete | **Last Updated**: July 2026
EOF

success "Created README.md"

# Step 7: Create GitHub Actions workflow
info ""
info "STEP 7: Creating GitHub Actions workflow..."

cat > .github/workflows/snake.yml << 'EOF'
name: Generate contribution snake

on:
  schedule:
    - cron: "0 */6 * * *"
  workflow_dispatch:
  push:
    branches:
      - main

permissions:
  contents: write

jobs:
  generate:
    runs-on: ubuntu-latest
    steps:
      - name: Generate the snake SVGs
        uses: Platane/snk@v3
        id: snake-gif
        with:
          github_user_name: ${{ github.repository_owner }}
          outputs: |
            dist/github-contribution-grid-snake.svg
            dist/github-contribution-grid-snake-dark.svg?palette=github-dark

      - name: Publish to the output branch
        uses: crazy-max/ghaction-github-pages@v4
        with:
          target_branch: output
          build_dir: dist
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
EOF

success "Created .github/workflows/snake.yml"

# Step 8: Create SVG assets placeholder
info ""
info "STEP 8: Creating SVG asset placeholders..."

cat > assets/stats-card.svg << 'EOF'
<svg viewBox="0 0 800 400" xmlns="http://www.w3.org/2000/svg">
  <rect width="800" height="400" fill="#0f172a"/>
  <text x="400" y="200" font-size="32" text-anchor="middle" fill="#14b8a6">Stats Card — Replace with actual SVG</text>
</svg>
EOF

success "Created assets/stats-card.svg (placeholder)"

# Step 9: Create .gitignore
info ""
info "STEP 9: Creating .gitignore..."

cat > .gitignore << 'EOF'
# Operating System
.DS_Store
Thumbs.db
*.log

# IDEs
.vscode/
.idea/
*.swp
*.swo

# Node
node_modules/
*.npm

# Build
dist/
build/
.next/

# Temporary
*.tmp
*.temp
EOF

success "Created .gitignore"

# Step 10: Git staging
info ""
info "STEP 10: Staging files for Git..."
git add . > /dev/null 2>&1
success "Files staged"

# Step 11: Initial commit
info ""
info "STEP 11: Creating initial commit..."
git commit -m "build: initialize animated GitHub profile" > /dev/null 2>&1 || warning "Commit skipped (may already exist)"
success "Initial commit ready"

# Display summary
info ""
info "=========================================="
success "LOCAL SETUP COMPLETE!"
info "=========================================="
info ""

echo -e "${CYAN}📁 Profile directory:${NC} $WORK_DIR"
echo -e "${CYAN}👤 GitHub Username:${NC} $GITHUB_USERNAME"
echo -e "${CYAN}📧 Email:${NC} $EMAIL"

info ""
info "🚀 NEXT STEPS (Manual):"
info ""
echo -e "${YELLOW}1. Create a PUBLIC GitHub repository:${NC}"
echo -e "${CYAN}   - Go to https://github.com/new${NC}"
echo -e "${CYAN}   - Repository name: $GITHUB_USERNAME${NC}"
echo -e "${CYAN}   - Public: ✓${NC}"
echo -e "${CYAN}   - Do NOT initialize with README${NC}"
echo ""

echo -e "${YELLOW}2. Connect local repository to GitHub:${NC}"
echo -e "${CYAN}   git remote add origin https://github.com/$GITHUB_USERNAME/$GITHUB_USERNAME.git${NC}"
echo ""

echo -e "${YELLOW}3. Push to GitHub:${NC}"
echo -e "${CYAN}   git branch -M main && git push -u origin main${NC}"
echo ""

echo -e "${YELLOW}4. Enable GitHub Actions:${NC}"
echo -e "${CYAN}   - Go to Settings → Actions → General${NC}"
echo -e "${CYAN}   - Set Workflow Permissions to 'Read and write'${NC}"
echo ""

echo -e "${YELLOW}5. Trigger snake animation:${NC}"
echo -e "${CYAN}   - Go to Actions tab → 'Generate contribution snake' → Run workflow${NC}"
echo ""

echo -e "${YELLOW}6. View your profile:${NC}"
echo -e "${CYAN}   - https://github.com/$GITHUB_USERNAME${NC}"
echo ""

info "📚 Documentation:"
info "   - DEPLOYMENT.md: Full setup guide"
info "   - QUICKREF.md: Quick reference card"
info "   - ADVANCED.md: Customization guide"
info ""

success "Setup script complete! Your profile is ready to deploy. 🎉"
info ""
echo -e "${CYAN}💡 Tip: You're now in the $WORK_DIR directory with a ready-to-push Git repo.${NC}"
