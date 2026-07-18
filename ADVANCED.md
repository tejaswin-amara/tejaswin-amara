# Advanced Customization Guide

This guide covers extending and customizing the profile beyond the basics. It's for developers comfortable with HTML, CSS, SVG, and GitHub Actions.

---

## 🎨 Advanced Color Customization

### Theme Variables

The entire profile uses a consistent color palette. To implement a complete theme, edit these hex values:

| Variable | Default | Usage |
|----------|---------|-------|
| `bg` | `#0f172a` | Dark navy background |
| `surface` | `#1e293b` | Slightly lighter surface (cards) |
| `accent-dark` | `#134e4a` | Teal accent (borders, secondary) |
| `accent-bright` | `#14b8a6` | Bright teal (primary highlights) |
| `text-primary` | `#e2e8f0` | Main text (headers, labels) |
| `text-secondary` | `#cbd5e1` | Descriptions, support text |
| `text-tertiary` | `#94a3b8` | Dates, metadata |

### Creating an Alternative Theme

To create a "neon" or "cyberpunk" variant:

1. Copy `README.md` → `README-neon.md`
2. Replace colors globally:
   ```bash
   sed -i 's/#14b8a6/#ff006e/g' README-neon.md
   sed -i 's/#134e4a/#3a0ca3/g' README-neon.md
   ```
3. Test by pushing to a branch and viewing the raw preview

### CSS-Only Customization

For third-party badges and cards using `github-stats-extended`, modify these URL parameters:

```
bg_color=0f172a        # Background
title_color=14b8a6     # Title text
text_color=e2e8f0      # Body text
icon_color=14b8a6      # Icon highlights
```

---

## 📊 Adding Custom Data Visualization

### Self-Hosted Stats Card

If you want complete control over stats rendering, replace the `github-stats-extended` image with a self-hosted solution:

```bash
# Use GitHub API directly
curl https://api.github.com/users/tejaswin-amara \
  -H "Accept: application/vnd.github.v3+json"
```

Parse the response and generate a custom SVG or HTML card.

### Custom Contribution Counter

Add a GitHub Actions workflow to count contributions and render a custom badge:

```yaml
name: Update contribution count

on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly
  workflow_dispatch:

jobs:
  update:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Count contributions
        run: |
          # Use GitHub API to count contributions
          CONTRIBUTIONS=$(curl -s https://api.github.com/users/tejaswin-amara \
            -H "Authorization: Bearer ${{ secrets.GITHUB_TOKEN }}" | jq '.public_repos')
          echo "Contributions: $CONTRIBUTIONS"
      - name: Push updates
        run: |
          git add .
          git commit -m "chore: update stats [skip ci]" || true
          git push
```

---

## 🔄 Automating Profile Updates

### Scheduled Content Updates

Create a workflow that automatically updates sections of your README:

```yaml
name: Auto-update achievements

on:
  schedule:
    - cron: '0 0 1 * *'  # First day of month
  workflow_dispatch:

jobs:
  update:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Update milestones
        run: |
          python3 scripts/update_milestones.py
      - name: Commit changes
        run: |
          git config user.name "Profile Bot"
          git config user.email "bot@example.com"
          git add .
          git commit -m "docs: auto-update achievements" || true
          git push
```

### Python Script for Auto-Updates

```python
# scripts/update_milestones.py
import re
from datetime import datetime

with open("README.md", "r") as f:
    content = f.read()

# Example: Update "Last updated" timestamp
timestamp = datetime.now().strftime("%B %Y")
content = re.sub(
    r"Last updated: .+?(?=\n)",
    f"Last updated: {timestamp}",
    content
)

with open("README.md", "w") as f:
    f.write(content)

print("✅ Profile updated!")
```

---

## 🔗 Integrating External Data Sources

### Fetching Data from APIs

You can pull real-time data into your profile using GitHub Actions:

```python
import requests
import json

# Example: Fetch latest blog posts
response = requests.get("https://api.example.com/blog")
posts = response.json()

# Format for README
content = "## Latest Posts\n\n"
for post in posts[:3]:
    content += f"- [{post['title']}]({post['url']}) — {post['date']}\n"

# Update README
with open("README.md", "r") as f:
    readme = f.read()

# Replace section
readme = re.sub(
    r"## Latest Posts.*?(?=##|$)",
    content,
    readme,
    flags=re.DOTALL
)

with open("README.md", "w") as f:
    f.write(readme)
```

---

## 🎬 Advanced SVG Animation Techniques

### Parallax Scrolling Effect

To add depth, use transform-origin on multiple elements:

```xml
<g style="transform-origin: 250px 250px;">
  <circle cx="250" cy="150" r="30" style="animation: rotate 30s linear infinite;" />
</g>
```

### Morphing Shapes

Use SVG `<animate>` with `values` for smooth transitions:

```xml
<circle cx="100" cy="100" r="10">
  <animate attributeName="r" values="10;20;10" dur="2s" repeatCount="indefinite" />
</circle>
```

### Gradient Animations

Animate gradient colors for dynamic effects:

```xml
<defs>
  <linearGradient id="anim-grad">
    <stop offset="0%" style="stop-color:#14b8a6;stop-opacity:1">
      <animate attributeName="stop-color" values="#14b8a6;#06b6d4;#14b8a6" dur="3s" repeatCount="indefinite" />
    </stop>
  </linearGradient>
</defs>
<rect fill="url(#anim-grad)" width="100" height="100" />
```

---

## 🚀 Performance Optimization

### Image Optimization

All images should be optimized for fast loading:

```bash
# Compress SVGs
svgo assets/*.svg

# Optimize PNG/JPG badges (if adding screenshots)
imagemin assets/*.png --out-dir=assets/optimized
```

### Lazy Loading

Add `loading="lazy"` to large images:

```markdown
<img src="assets/large-chart.svg" loading="lazy" width="100%" alt="Chart" />
```

### CDN Caching

All external badge/stats services use CDN caching by default. Force refresh with:

```
?t=timestamp  # Bypass cache
```

Example:
```
https://github-stats-extended.vercel.app/api?username=tejaswin-amara&t=20260718
```

---

## 🔐 Security Considerations

### Protecting Sensitive Information

**Never commit**:
- Personal email addresses (use public GitHub email or masked)
- API keys or tokens (use GitHub Secrets)
- Private repository URLs
- Personal phone numbers

### Validating External Content

Only embed images/iframes from trusted sources:

```markdown
<!-- ✅ Safe: GitHub, Shields.io, official services -->
<img src="https://github-stats-extended.vercel.app/..." />

<!-- ❌ Risky: Unknown third-party CDNs -->
<img src="https://random-cdn.example.com/..." />
```

---

## 📈 Tracking Profile Analytics

### GitHub Insights

Monitor your profile's visibility:

1. Go to **Settings → Pages → GitHub Pages analytics**
2. Track weekly visitors and top referrers

### Custom Analytics

Add a tracking pixel (optional, respect privacy):

```markdown
<img src="https://analytics.example.com/track?user=tejaswin-amara" width="1" height="1" />
```

---

## 🐛 Debugging Tips

### Testing Markdown Locally

```bash
# Preview markdown with GitHub CSS
npm install -g grip
grip README.md
# Opens http://localhost:6419
```

### Validating SVG Syntax

```bash
# Check SVG validity
npx svgcheck assets/stats-card.svg
```

### Checking External Links

```bash
# Find broken links
npm install -g markdown-link-check
markdown-link-check README.md
```

---

## 📚 Resources for Advanced Developers

| Resource | Purpose |
|----------|---------|
| [GitHub REST API](https://docs.github.com/rest) | Fetch GitHub data programmatically |
| [GitHub GraphQL API](https://docs.github.com/graphql) | Efficient data queries |
| [Actions Marketplace](https://github.com/marketplace?type=actions) | Pre-built automation workflows |
| [SVG Spec](https://www.w3.org/TR/SVG2/) | Official SVG animation documentation |
| [SVGX](https://www.svgx.app/) | Online SVG editor with animation preview |
| [Vercel](https://vercel.com) | Deploy custom serverless functions for badges |

---

**Last Updated**: July 2026  
**Audience**: Developers and power users  
**Status**: Advanced reference
