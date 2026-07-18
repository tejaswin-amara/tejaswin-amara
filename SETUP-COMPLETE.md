# 🚀 Complete Setup Guide — From Zero to Live Profile

**Estimated Time**: 10–15 minutes  
**Difficulty**: Beginner-friendly  
**Prerequisites**: GitHub account + Git installed

---

## 📋 Overview

This guide takes you through the complete process of setting up your animated GitHub profile. It's split into two phases:

1. **Automated Setup** (5 min) — Run a script that sets up your local Git repo
2. **Manual GitHub Steps** (3 min) — Create the repo on GitHub and enable features
3. **First-Time Animations** (1 min) — Trigger the snake workflow

---

## Phase 1: Automated Local Setup

### For Windows Users (PowerShell)

```powershell
# Open PowerShell as Administrator
# Navigate to where you downloaded the files

# Run the setup script
.\setup.ps1

# Or with custom username/email:
.\setup.ps1 -GitHubUsername "your-username" -Email "your-email@example.com"
```

**The script will:**
- ✅ Check Git installation
- ✅ Create working directory (default: `$env:USERPROFILE\Desktop\tejaswin-amara`)
- ✅ Initialize Git repository
- ✅ Create README.md with all animations
- ✅ Create .github/workflows/snake.yml
- ✅ Create SVG asset placeholders
- ✅ Create .gitignore
- ✅ Stage and commit all files locally

### For macOS/Linux Users (Bash)

```bash
# Navigate to where you downloaded the files
cd /path/to/files

# Make script executable
chmod +x setup.sh

# Run the setup script
./setup.sh

# Or with custom username/email:
./setup.sh "your-username" "your-email@example.com"
```

**The script will:** (same as PowerShell version)

### What the Script Does

```
Local Computer
│
├─→ Checks Git is installed
├─→ Creates: ~/Desktop/tejaswin-amara/ (or custom path)
├─→ Initializes: Git repository
├─→ Creates: README.md with all animations
├─→ Creates: .github/workflows/snake.yml (GitHub Actions)
├─→ Creates: assets/stats-card.svg (placeholder)
├─→ Creates: .gitignore
└─→ Commits: All files locally (ready to push)
```

---

## Phase 2: GitHub Setup

### Step 1: Create Repository on GitHub

1. Go to **https://github.com/new**
2. Set **Repository name** to your exact GitHub username (e.g., `tejaswin-amara`)
   - ⚠️ **IMPORTANT**: Must match your username exactly for it to show as your profile
3. Set to **Public** (not private)
4. ❌ Do **NOT** initialize with:
   - README
   - .gitignore
   - License
5. Click **Create repository**

**Result**: Empty GitHub repository ready to receive your files

### Step 2: Connect Local Repo to GitHub

After the script completes, you'll be in your local directory. Copy-paste these commands:

```bash
# Add GitHub as remote origin
git remote add origin https://github.com/YOUR-USERNAME/YOUR-USERNAME.git

# Rename branch to main (if using older Git)
git branch -M main

# Push all files to GitHub
git push -u origin main
```

**Replace `YOUR-USERNAME` with your actual GitHub username**

Example:
```bash
git remote add origin https://github.com/tejaswin-amara/tejaswin-amara.git
git branch -M main
git push -u origin main
```

**Expected output**: Files are uploaded to GitHub

### Step 3: Enable GitHub Actions

1. Go to your repository: **https://github.com/YOUR-USERNAME/YOUR-USERNAME**
2. Click **Settings** (top right)
3. Left sidebar → **Actions** → **General**
4. Under "Workflow permissions", select **"Read and write permissions"**
5. Click **Save**

**Why?** The snake workflow needs permission to commit files to your `output` branch.

---

## Phase 3: First-Time Animation Trigger

### Manually Run Snake Workflow

1. Go to your repository: **https://github.com/YOUR-USERNAME/YOUR-USERNAME**
2. Click **Actions** tab (near top)
3. Find workflow called **"Generate contribution snake"**
4. Click **Run workflow** dropdown
5. Keep branch as `main`
6. Click **Run workflow** button
7. Wait 2–3 minutes for completion

**What it does**: Generates animated SVG of your GitHub contributions graph

**Result**: New `output` branch is created with generated snake images

---

## Phase 4: Verify Your Profile

### Visit Your Profile

```
https://github.com/YOUR-USERNAME
```

**You should see:**
- ✅ Waving animated header banner
- ✅ Typing text animation with your bio
- ✅ GitHub stats cards
- ✅ Profile view counter badge
- ✅ Technology stack badges
- ✅ Featured projects section
- ✅ SVG animations (if assets are updated)
- ✅ Contribution snake graph (may take 1 hour to appear first time)

### Troubleshooting Display

| Issue | Solution |
|-------|----------|
| Badges not loading | Hard refresh: `Ctrl+Shift+R` |
| Snake not showing | Wait 1 hour or manually re-run workflow |
| Stats card blank | Repository must be public (check Settings) |
| Animations slow | Normal on first load; caches improve speed |

---

## 📝 Customizing Your Profile

### Quick Edits (No Setup Needed)

After deployment, you can edit directly on GitHub:

1. Go to **your profile repo**
2. Click **README.md**
3. Click pencil icon (Edit)
4. Make changes
5. Click **Commit changes**

**Common edits:**
- Update CGPA: `8.11` → your value
- Add projects: Find "Featured projects" section
- Change colors: Find hex codes like `#14b8a6`
- Update email: Find `tejaswinamara@klh.edu.in`

### Color Theme Change

To change the entire color scheme globally:

1. Open README.md for editing (click pencil icon)
2. Use Find & Replace (`Ctrl+H`):
   - Replace `0f172a` with your background color
   - Replace `134e4a` with your secondary accent
   - Replace `14b8a6` with your primary accent
3. Commit changes

**Color palette**:
- `0f172a` = Dark navy background
- `134e4a` = Teal secondary
- `14b8a6` = Bright teal primary

### Adding More SVG Assets

If you want to add the enhanced SVG cards from the package:

1. Download `stats-card.svg`, `tech-radar.svg`, `milestones.svg` from the outputs
2. Go to your GitHub repo
3. Upload files to the `assets/` folder
4. Commit
5. They'll automatically display in README.md (if linked correctly)

---

## 🔄 Maintenance Checklist

### Weekly
- [ ] Check if badges are loading
- [ ] Verify profile looks good

### Monthly
- [ ] Update any project links if broken
- [ ] Run snake workflow manually to refresh
- [ ] Review stats cards for accuracy

### Quarterly
- [ ] Add new projects to Featured section
- [ ] Update achievements or milestones
- [ ] Refresh content if needed

### Annually
- [ ] Full visual audit (colors, animations, layout)
- [ ] Update CGPA if changed
- [ ] Refresh research/publications
- [ ] Re-run all automated assets

---

## 🆘 Help & Troubleshooting

### Git Errors

**Error**: `fatal: not a git repository`
- **Solution**: Make sure you're in the correct directory
- **Check**: `ls .git` (should show git configuration)

**Error**: `Permission denied (publickey)`
- **Solution**: You haven't set up SSH keys for GitHub
- **Fix**: Use HTTPS instead: `git remote set-url origin https://...`

**Error**: `git push` hangs or times out
- **Solution**: GitHub Actions might be busy
- **Fix**: Wait a few minutes and try again, or use `--quiet` flag

### GitHub Errors

**Error**: "Repository not found" when pushing
- **Solution**: Repository name must match your GitHub username exactly
- **Check**: Go to `https://github.com/YOUR-USERNAME/YOUR-USERNAME`

**Error**: "Cannot push to this repository"
- **Solution**: You may not be authenticated
- **Fix**: 
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your@email.com"
  ```

**Error**: "Actions disabled for this repository"
- **Solution**: Enable Actions in Settings → Actions
- **Check**: Public repositories have Actions enabled by default

### Profile Not Showing

**Problem**: Your profile README isn't showing
- **Cause**: Repository name doesn't match GitHub username
- **Solution**: Delete and recreate with exact username
- **Verify**: 
  ```
  Expected: github.com/YOUR-USERNAME/YOUR-USERNAME
  Check: Repository name in Settings
  ```

**Problem**: Animations not playing
- **Cause**: External services (Vercel, shields.io) may be temporarily down
- **Solution**: Wait 1 hour and refresh; most services are back up quickly
- **Status**: Check service status:
  - https://status.vercel.com/
  - https://shields.io/

**Problem**: Stats card shows 404
- **Cause**: GitHub profile is private
- **Solution**: Go to Settings → Profile visibility → Public
- **Check**: Your profile must be public for stats to load

---

## 📞 Getting More Help

### For Setup Issues
Read **DEPLOYMENT.md** in the package

### For Customization
Read **ADVANCED.md** in the package

### For Quick Reference
Read **QUICKREF.md** (one-page cheat sheet)

### For Contributing with Peers
Read **CONTRIBUTING.md**

---

## ✅ Final Checklist

Copy and paste to track progress:

```
FINAL CHECKLIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Phase 1: Automated Local Setup
  ☐ Downloaded setup.ps1 (Windows) or setup.sh (Mac/Linux)
  ☐ Ran the setup script successfully
  ☐ All files created locally without errors

Phase 2: GitHub Setup
  ☐ Created public repository named "YOUR-USERNAME"
  ☐ Connected local repo to GitHub (git remote add origin)
  ☐ Pushed all files to GitHub (git push -u origin main)
  ☐ Enabled GitHub Actions (Settings → Actions → "Read and write")

Phase 3: Animation Trigger
  ☐ Manually ran "Generate contribution snake" workflow
  ☐ Workflow completed successfully (check Actions tab)

Phase 4: Verification
  ☐ Visited https://github.com/YOUR-USERNAME
  ☐ Waving header displays
  ☐ Typing animation plays
  ☐ Stats badges load
  ☐ Tech stack shows
  ☐ Featured projects display

Optional: Customization
  ☐ Updated CGPA/stats if needed
  ☐ Changed color theme (if desired)
  ☐ Added SVG assets (if desired)

Final
  ☐ Bookmarked profile URL
  ☐ Shared profile link with friends
  ☐ Saved QUICKREF.md for future edits

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PROFILE LIVE! 🎉
```

---

## 🎉 You're Done!

Your animated GitHub profile is now live and visible to the world.

**What happens next:**
- Your profile appears when people visit `github.com/YOUR-USERNAME`
- Stats update automatically every day
- Snake animation refreshes every 6 hours
- Badges cache and load fast
- You can edit anytime via GitHub's web editor

**Keep improving:**
- Add new projects as you build them
- Update achievements quarterly
- Tweak colors and content as desired
- Share with friends and collaborators

---

**Questions?** See the documentation files in the package.  
**Ready to customize?** See ADVANCED.md for power-user guides.  
**Need quick help?** See QUICKREF.md for common edits.

**Your profile is ready. Go ship it! 🚀**

---

**Last Updated**: July 18, 2026  
**Version**: 1.0  
**Status**: Production-Ready
