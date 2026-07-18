# Quick Reference Card

## 📋 File Structure

```
tejaswin-amara/
├── README.md                           # Main profile (THE STAR)
├── .github/workflows/snake.yml         # Auto-generates contribution snake
├── assets/
│   ├── stats-card.svg                 # Animated stats & highlights
│   ├── tech-radar.svg                 # Rotating tech stack
│   └── milestones.svg                 # Achievement timeline
├── DEPLOYMENT.md                       # Setup guide
├── CONTRIBUTING.md                     # How to contribute
└── ADVANCED.md                         # Power-user customization
```

---

## 🚀 Setup in 5 Minutes

```bash
# 1. Create repo named after your GitHub username
#    Go to github.com/new → name: tejaswin-amara → Public

# 2. Clone and copy files
git clone https://github.com/tejaswin-amara/tejaswin-amara.git
cd tejaswin-amara
cp -r /path/to/assets .
cp /path/to/README.md .
mkdir -p .github/workflows && cp /path/to/snake.yml .github/workflows/

# 3. Push
git add . && git commit -m "build: init animated profile" && git push -u origin main

# 4. Enable GitHub Actions (Settings → Actions → General → "Read and write permissions")

# 5. Trigger snake (Actions tab → "Generate contribution snake" → Run workflow)

# 6. Visit https://github.com/tejaswin-amara and refresh!
```

---

## 🎨 Color Palette

| Name | Hex | Usage |
|------|-----|-------|
| Dark Navy | `#0f172a` | Background |
| Slate 300 | `#1e293b` | Cards/surfaces |
| Teal 700 | `#134e4a` | Accents/borders |
| Teal 500 | `#14b8a6` | Highlights/primary |
| Light Slate | `#e2e8f0` | Main text |
| Gray Slate | `#94a3b8` | Secondary text |

**To change the entire theme**: Replace these 3 hex codes everywhere:
- `0f172a` → your bg
- `134e4a` → your secondary
- `14b8a6` → your primary

---

## 📊 External Services Used

| Badge/Stat | URL | Customization |
|-----------|-----|---|
| Stats Card | `github-stats-extended.vercel.app` | `?bg_color=0f172a&title_color=14b8a6` |
| Streak | `streak-stats.demolab.com` | `?background=0f172a&ring=14b8a6` |
| Snake | `Platane/snk` GitHub Action | `.github/workflows/snake.yml` |
| Header/Footer | `capsule-render.vercel.app` | URL params: `color=0:0f172a,50:134e4a,100:14b8a6` |
| Typing SVG | `readme-typing-svg.demolab.com` | `?color=14B8A6` |
| Badges | `shields.io` | Full customization available |

---

## 🔧 Common Edits

### Update CGPA or Stats
Edit line in `README.md`:
```markdown
- 8.11 CGPA (KL)  ← Change this number
```

### Add a New Project
In Featured Projects section:
```markdown
<a href="https://github.com/username/repo"><img src="https://github-stats-extended.vercel.app/api/pin/?username=username&repo=repo&hide_border=true&bg_color=0f172a&title_color=14b8a6&text_color=e2e8f0&icon_color=14b8a6" alt="Repo Name" /></a>
```

### Change Badge Color
```markdown
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge)
                                                         ↑ Change this color
```

### Update Profile Link
Search-replace in `README.md`:
- `tejaswin-amara` → your username (all instances)
- `tejaswinamara@klh.edu.in` → your email

---

## ✅ Pre-Launch Checklist

- [ ] Repo created as `<your-github-username>`
- [ ] All files copied to correct paths
- [ ] Updated all `tejaswin-amara` → your username (README, workflows)
- [ ] Updated email to your public email
- [ ] Updated CGPA/stats if different
- [ ] GitHub Actions enabled with write permissions
- [ ] Snake workflow manually triggered once
- [ ] Profile visited and verified
- [ ] Links tested (Featured projects, badges)
- [ ] Shared profile URL with friends

---

## 🔗 Quick Links

- **View Your Profile**: `https://github.com/your-username`
- **Edit Files**: `https://github.com/your-username/your-username/edit/main/README.md`
- **Test Locally**: `npm i -g grip && grip README.md`
- **Report Issues**: Create an issue in the repo
- **Customize Colors**: Use this [Color Picker](https://htmlcolorcodes.com/) and update hex codes

---

## 📞 Troubleshooting at a Glance

| Problem | Solution |
|---------|----------|
| Snake not showing | Run workflow manually in Actions tab, wait 2–3 min |
| Badges broken | Check GitHub privacy (must be public), wait 1 hour |
| Weird formatting | Hard refresh browser (`Ctrl+Shift+R`) |
| Colors look different | Check hex codes in README match palette |
| Profile page blank | Ensure repo name matches your GitHub username exactly |

---

## 🚀 Next Steps After Setup

1. **Customize colors** if you don't like teal (see ADVANCED.md)
2. **Add more projects** to the Featured section
3. **Update achievements** quarterly as you ship new work
4. **Join the gists** — share your setup on GitHub Gists with #github-profile
5. **Check CONTRIBUTING.md** if others want to collaborate

---

**Version**: 1.0 | **Last Updated**: July 2026 | **Status**: Production-Ready
