# GitHub Profile Setup Guide

This package contains everything needed to make your GitHub profile visually distinctive and fully animated. Below is a step-by-step deployment guide.

## 📋 Contents

```
tejaswin-amara/                          # Your profile repo (username must match GitHub handle)
├── README.md                            # Main profile README with badges & animations
├── .github/workflows/
│   └── snake.yml                        # Contribution snake animation workflow
└── assets/
    ├── stats-card.svg                   # Animated stats and highlights
    ├── tech-radar.svg                   # Rotating technology stack radar
    └── milestones.svg                   # Timeline of achievements & impact
```

## 🚀 Deployment Steps

### 1. Create the Profile Repository

GitHub has a special convention: if you create a repository with the same name as your username, that repository's README becomes your profile page.

1. Go to **https://github.com/new**
2. Set the repository name to **`tejaswin-amara`** (must match your GitHub username exactly)
3. Set it to **Public**
4. **Do NOT** initialize with a README, .gitignore, or license
5. Click **Create repository**

### 2. Clone and Copy Files

```bash
# Clone your newly created repo
git clone https://github.com/tejaswin-amara/tejaswin-amara.git
cd tejaswin-amara

# Copy all files from this package
# Ensure the structure matches the Contents section above
cp -r /path/to/assets/ .
cp /path/to/README.md .
mkdir -p .github/workflows
cp /path/to/.github/workflows/snake.yml .github/workflows/
```

### 3. Configure Git (if needed)

```bash
git config user.name "Tejaswin Amara"
git config user.email "tejaswinamara@klh.edu.in"
```

### 4. Push to GitHub

```bash
git add .
git commit -m "build: initialize animated GitHub profile"
git branch -M main
git push -u origin main
```

### 5. Enable GitHub Actions

The contribution snake animation requires GitHub Actions with write permissions.

1. Go to **Settings → Actions → General**
2. Under **Workflow permissions**, select **"Read and write permissions"**
3. Click **Save**

### 6. Trigger the Snake Animation

1. Go to the **Actions** tab in your repository
2. Find **"Generate contribution snake"** workflow
3. Click **Run workflow** (keep branch as `main`)
4. Wait ~2 minutes for it to complete

Once complete, it creates an `output` branch with the generated snake SVG files.

### 7. Verify Your Profile

Visit **https://github.com/tejaswin-amara** in your browser. You should see:

- ✅ Animated waving header banner
- ✅ Typing text animation with your bio
- ✅ GitHub stats and streak cards
- ✅ Contribution snake (may take one full 6-hour cycle or manual re-run to render)
- ✅ Featured projects with animated cards
- ✅ Custom SVG assets (stats card, tech radar, milestones)

---

## 🎨 Customization

### Color Scheme

The profile uses a slate-to-teal gradient throughout. To change colors globally:

1. Open `README.md`
2. Replace all instances of these hex codes:
   - `0f172a` → Dark navy (background)
   - `134e4a` → Teal (accents)
   - `14b8a6` → Bright teal (highlights)

### Adding More Badges

In the **Stack** section, add new badge rows:

```markdown
![Rust](https://img.shields.io/badge/Rust-CE422B?style=for-the-badge&logo=rust&logoColor=white)
```

Find badge URLs at **https://shields.io** or **https://github.com/Ileriayo/markdown-badges**.

### Updating Stats

The profile uses `github-stats-extended.vercel.app` for stats cards. They auto-update daily, but you can force refresh by visiting:

```
https://github-stats-extended.vercel.app/api?username=tejaswin-amara
```

### Custom Animations

All `.svg` files in `/assets/` use CSS `@keyframes` animations. Edit them directly to:
- Change animation timing (`0.6s` → `1s`)
- Modify colors (`#14b8a6` → your color)
- Add new keyframe sequences

---

## 🔄 Maintenance

### Monthly Tasks

- **Verify links** in the Featured Projects section still point to active repos
- **Update highlights** if new publications or achievements occur
- **Refresh stats** by running the snake workflow manually

### Annual Tasks

- Update CGPA if it changes
- Refresh research & publication links
- Rotate featured projects based on current activity

---

## 📊 Third-Party Services Used

| Service | Purpose | Uptime | Link |
|---------|---------|--------|------|
| `capsule-render` | Header/footer banners | ✅ Stable | https://capsule-render.vercel.app |
| `readme-typing-svg` | Typing animation | ✅ Stable | https://readme-typing-svg.demolab.com |
| `github-stats-extended` | Stats cards | ✅ Stable | https://github-stats-extended.vercel.app |
| `streak-stats` | Contribution streak | ✅ Stable | https://streak-stats.demolab.com |
| `Platane/snk` | Contribution snake | ✅ Stable | https://github.com/Platane/snk |
| `shields.io` | Badge generator | ✅ Stable | https://shields.io |
| `komarev` | Profile views counter | ✅ Stable | https://komarev.com |

All services are free and widely used across GitHub profiles. If any service goes down, badges will simply render as broken images without affecting your profile's structure.

---

## ❓ Troubleshooting

### Snake animation not showing

- **Cause**: Workflow hasn't run yet or `output` branch wasn't created
- **Fix**: 
  1. Go to **Actions** tab
  2. Run the **"Generate contribution snake"** workflow manually
  3. Wait 2–3 minutes
  4. Refresh your profile page (hard refresh: `Ctrl+Shift+R`)

### Stats card showing 404

- **Cause**: GitHub account is private or stats service is rate-limited
- **Fix**: 
  1. Ensure your GitHub profile is **public**
  2. Wait 1 hour and refresh
  3. Try the direct stats URL: `https://github-stats-extended.vercel.app/api?username=tejaswin-amara`

### Badges not loading

- **Cause**: shields.io is temporarily down or image URL is incorrect
- **Fix**: 
  1. Test the badge URL directly in browser
  2. Check for typos in the markdown
  3. Rebuild the badges using https://shields.io

### Styling looks different on mobile

- **Cause**: Mobile renders may break wide SVG layouts
- **Behavior**: Expected — badges and animations scale automatically but may stack
- **Note**: This is normal for GitHub's responsive design

---

## 🔗 Additional Resources

- **Markdown Badges**: https://github.com/Ileriayo/markdown-badges
- **GitHub Profile README Guide**: https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/customizing-your-profile/managing-your-profile-readme
- **Awesome GitHub Profile READMEs**: https://github.com/abhisheknaiidu/awesome-github-profile-readme
- **SVG Animation Guide**: https://developer.mozilla.org/en-US/docs/Web/SVG/Animation

---

## ✨ One-Time Setup Checklist

- [ ] Created `tejaswin-amara` repository
- [ ] Pushed all files to `main` branch
- [ ] Enabled GitHub Actions with write permissions
- [ ] Ran snake animation workflow
- [ ] Verified profile renders correctly
- [ ] Clicked **Follow** button (if checking from another account)
- [ ] Shared profile link with peers

---

**Last Updated**: July 2026  
**Status**: Production-ready  
**Maintenance**: Minimal (auto-updates via GitHub Actions)
