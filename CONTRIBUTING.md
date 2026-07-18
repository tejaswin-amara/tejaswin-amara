# Contributing to This Profile

This GitHub profile is a **living document** reflecting current projects, achievements, and collaborations. Contributions are welcome from collaborators, peers, and the community.

## How to Contribute

### Adding Your Name to Collaborators

If you're working closely with Tejaswin, you can be added to the collaborators section. Create a pull request with:

1. Your GitHub username
2. A one-line description of your collaboration focus (e.g., "Full-stack development", "UI/UX design", "Research partner")
3. Your GitHub profile link

**Example PR**:
```markdown
- [Collaborator Name](https://github.com/username) — description of collaboration focus
```

### Reporting Broken Links

If any featured project links are broken or outdated:

1. Open an issue with the label `broken-link`
2. Include the broken link URL
3. Suggest a replacement if available

### Suggesting New Projects to Feature

If you think a project deserves the **Featured** spotlight:

1. Open an issue with the label `feature-request`
2. Link to the GitHub repository
3. Explain why it should be featured

### Updating Profile Information

If there are significant life changes to announce:

1. Update relevant sections in the README
2. Ensure all links still point to active resources
3. Commit with a descriptive message: `docs: add [achievement/update]`

---

## Development Workflow

### Local Testing

```bash
# Clone this repository
git clone https://github.com/tejaswin-amara/tejaswin-amara.git
cd tejaswin-amara

# Make your edits
# Test by previewing markdown locally or pushing to a branch

# Push changes
git push origin your-branch-name
```

### PR Guidelines

1. **Descriptive titles**: "docs: add Q3 2026 achievements" (not "update")
2. **Small, focused changes**: One logical change per PR
3. **Link verification**: Test all links in the README before submitting
4. **Screenshot preview**: For SVG/visual changes, attach a screenshot of the rendered result
5. **Self-review**: Use the PR checklist below before submitting

### PR Checklist

- [ ] All links are active and point to correct resources
- [ ] No broken references in the Collaborators section
- [ ] SVG files render correctly (test locally in browser)
- [ ] Markdown formatting is clean (no trailing spaces, proper indentation)
- [ ] Stats/badges reflect current state
- [ ] No sensitive information is exposed
- [ ] Changes align with the overall design aesthetic

---

## Updating SVG Animations

The profile includes custom animated SVGs. To modify them:

1. **Don't** use external editors like Figma if possible — edit the `.svg` file directly
2. **Preserve** all `@keyframes` and `<defs>` sections
3. **Test** animations by opening the SVG in a browser:
   ```bash
   open assets/stats-card.svg
   # or
   start assets/stats-card.svg  # Windows
   ```
4. **Verify** animation timing and color consistency

### Common SVG Edits

**Change animation speed**:
```css
animation: slideIn 0.6s ease-out forwards;  /* Change 0.6s to desired duration */
```

**Change colors**:
```xml
<circle fill="#14b8a6" />  <!-- Bright teal; change hex code -->
```

**Add new animated element**:
```xml
<g class="timeline-item">
  <!-- Your new element -->
</g>
```

---

## Maintenance Calendar

- **Monthly**: Verify all external links (stats badges, project URLs)
- **Quarterly**: Update achievements and milestones
- **Biannually**: Refresh featured projects and tech stack if needed
- **Annually**: Full visual audit (colors, badges, animations)

---

## Questions?

For questions about contributing, open an issue with the label `question` or reach out directly:

- **Email**: tejaswinamara@klh.edu.in
- **LinkedIn**: [@tejaswin-amara](https://www.linkedin.com/in/tejaswin-amara/)

---

**Thank you for helping keep this profile fresh and accurate!**
