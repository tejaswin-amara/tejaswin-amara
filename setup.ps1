# GitHub Profile Setup Script (PowerShell)
# Automates deployment of animated GitHub profile
# Usage: .\setup.ps1

param(
    [string]$GitHubUsername = "tejaswin-amara",
    [string]$Email = "tejaswinamara@klh.edu.in",
    [string]$WorkDir = "$env:USERPROFILE\Desktop\tejaswin-amara"
)

# Color output functions
function Write-Success {
    Write-Host "✅ $args" -ForegroundColor Green
}

function Write-Info {
    Write-Host "ℹ️  $args" -ForegroundColor Cyan
}

function Write-Warning {
    Write-Host "⚠️  $args" -ForegroundColor Yellow
}

function Write-Error {
    Write-Host "❌ $args" -ForegroundColor Red
}

Clear-Host
Write-Info "GitHub Profile Setup Script (PowerShell)"
Write-Info "=========================================="
Write-Info ""

# Step 1: Check prerequisites
Write-Info "STEP 1: Checking prerequisites..."

$gitExists = $null -ne (Get-Command git -ErrorAction SilentlyContinue)
if (-not $gitExists) {
    Write-Error "Git not found. Please install Git for Windows from https://git-scm.com/download/win"
    exit 1
}
Write-Success "Git is installed"

# Step 2: Create working directory
Write-Info ""
Write-Info "STEP 2: Creating working directory..."
if (Test-Path $WorkDir) {
    Write-Warning "Directory already exists: $WorkDir"
    $response = Read-Host "Overwrite? (y/n)"
    if ($response -eq 'y') {
        Remove-Item -Recurse -Force $WorkDir
        Write-Success "Directory cleared"
    } else {
        Write-Info "Using existing directory"
    }
} else {
    New-Item -ItemType Directory -Path $WorkDir | Out-Null
    Write-Success "Created directory: $WorkDir"
}

# Step 3: Initialize Git repository
Write-Info ""
Write-Info "STEP 3: Initializing Git repository..."
Set-Location $WorkDir

if (Test-Path .git) {
    Write-Info "Repository already exists"
} else {
    git init | Out-Null
    Write-Success "Initialized Git repository"
}

# Step 4: Configure Git
Write-Info ""
Write-Info "STEP 4: Configuring Git..."
git config user.name "Tejaswin Amara" 2>$null | Out-Null
git config user.email $Email 2>$null | Out-Null
Write-Success "Git configured (local scope)"

# Step 5: Create file structure
Write-Info ""
Write-Info "STEP 5: Creating file structure..."

$structure = @(
    ".",
    ".github",
    ".github\workflows",
    "assets"
)

foreach ($dir in $structure) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}
Write-Success "Directory structure created"

# Step 6: Create README.md (simplified inline for this script)
Write-Info ""
Write-Info "STEP 6: Creating README.md..."

$readmeContent = @'
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
'@

Set-Content -Path "README.md" -Value $readmeContent -Encoding UTF8
Write-Success "Created README.md"

# Step 7: Create GitHub Actions workflow
Write-Info ""
Write-Info "STEP 7: Creating GitHub Actions workflow..."

$workflowContent = @'
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
'@

Set-Content -Path ".github\workflows\snake.yml" -Value $workflowContent -Encoding UTF8
Write-Success "Created .github/workflows/snake.yml"

# Step 8: Create SVG assets placeholder
Write-Info ""
Write-Info "STEP 8: Creating SVG asset placeholders..."

$statsCard = @'
<svg viewBox="0 0 800 400" xmlns="http://www.w3.org/2000/svg">
  <rect width="800" height="400" fill="#0f172a"/>
  <text x="400" y="200" font-size="32" text-anchor="middle" fill="#14b8a6">Stats Card — Replace with actual SVG</text>
</svg>
'@

Set-Content -Path "assets\stats-card.svg" -Value $statsCard -Encoding UTF8
Write-Success "Created assets/stats-card.svg (placeholder)"

# Step 9: Create .gitignore
Write-Info ""
Write-Info "STEP 9: Creating .gitignore..."

$gitignoreContent = @'
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
'@

Set-Content -Path ".gitignore" -Value $gitignoreContent -Encoding UTF8
Write-Success "Created .gitignore"

# Step 10: Git staging and initial commit
Write-Info ""
Write-Info "STEP 10: Staging files for Git..."

git add . 2>$null | Out-Null
Write-Success "Files staged"

Write-Info ""
Write-Info "STEP 11: Creating initial commit..."

git commit -m "build: initialize animated GitHub profile" 2>$null | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Success "Initial commit created"
} else {
    Write-Warning "Commit may have been skipped (files already committed)"
}

# Step 12: Display summary and next steps
Write-Info ""
Write-Info "=========================================="
Write-Info "✅ LOCAL SETUP COMPLETE!"
Write-Info "=========================================="
Write-Info ""

Write-Host "📁 Profile directory: " -NoNewline -ForegroundColor Cyan
Write-Host $WorkDir

Write-Host "👤 GitHub Username: " -NoNewline -ForegroundColor Cyan
Write-Host $GitHubUsername

Write-Host "📧 Email: " -NoNewline -ForegroundColor Cyan
Write-Host $Email

Write-Info ""
Write-Info "🚀 NEXT STEPS (Manual):"
Write-Info ""
Write-Host "1. Create a PUBLIC GitHub repository:" -ForegroundColor Yellow
Write-Host "   - Go to https://github.com/new" -ForegroundColor Gray
Write-Host "   - Repository name: $GitHubUsername" -ForegroundColor Gray
Write-Host "   - Public: ✓" -ForegroundColor Gray
Write-Host "   - Do NOT initialize with README" -ForegroundColor Gray
Write-Host ""

Write-Host "2. Connect local repository to GitHub:" -ForegroundColor Yellow
$pushCommand = "git remote add origin https://github.com/$GitHubUsername/$GitHubUsername.git"
Write-Host "   $pushCommand" -ForegroundColor Gray
Write-Host ""

Write-Host "3. Push to GitHub:" -ForegroundColor Yellow
$pushBranch = "git branch -M main && git push -u origin main"
Write-Host "   $pushBranch" -ForegroundColor Gray
Write-Host ""

Write-Host "4. Enable GitHub Actions:" -ForegroundColor Yellow
Write-Host "   - Go to https://github.com/$GitHubUsername/$GitHubUsername/settings/actions" -ForegroundColor Gray
Write-Host "   - Set Workflow Permissions to 'Read and write'" -ForegroundColor Gray
Write-Host ""

Write-Host "5. Trigger snake animation:" -ForegroundColor Yellow
Write-Host "   - Go to Actions tab → 'Generate contribution snake' → Run workflow" -ForegroundColor Gray
Write-Host ""

Write-Host "6. View your profile:" -ForegroundColor Yellow
Write-Host "   - https://github.com/$GitHubUsername" -ForegroundColor Gray
Write-Host ""

Write-Info "📚 Documentation:"
Write-Info "   - DEPLOYMENT.md: Full setup guide"
Write-Info "   - QUICKREF.md: Quick reference card"
Write-Info "   - ADVANCED.md: Customization guide"
Write-Info ""

Write-Success "Setup script complete! Your profile is ready to deploy. 🎉"
Write-Info ""
Write-Host "💡 Tip: Copy the git commands above and run them to push to GitHub." -ForegroundColor Cyan
