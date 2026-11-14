#!/usr/bin/env python3
"""Zero-dependency stdlib verification suite for tejaswin-amara/tejaswin-amara."""
import re
import subprocess
import sys
import unittest
import xml.etree.ElementTree as ET
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SVG_FILES = [
    "header.svg",
    "terminal.svg",
    "about.svg",
    "stack.svg",
    "projects.svg",
    "footer.svg",
]
REQUIRED_REPOS = [
    "campus-connect",
    "Sovereign-OS",
    "FounderGate",
    "chatlens",
    "kl-sync",
    "klu-erp-autofill",
    "AgriGuard-AI",
    "Resume_Job_Matching_Talent_Marketplace_Engine",
    "Fake-News-Detection-Using-NLP-LSTM-and-BERT-Transformer-Models",
    "Linux-Dynamic-Memory-Allocation-and-Memory-Monitoring-System",
    "Multithreaded-Linux-Task-Processing-Engine",
    "KLH_CSIT_2026-27_CNNP_S11",
    "orbitpm",
    "Quiz-Platform",
]
SHA_RE = re.compile(r"^[0-9a-f]{40}$")
USES_RE = re.compile(r"^\s*-?\s*uses:\s*['\"]?([^\s'\"#]+)", re.M)


class ProfileRepositoryTest(unittest.TestCase):
    def test_svg_assets_valid_xml_and_zero_c2pa_bloat(self):
        for name in SVG_FILES:
            path = ROOT / "assets" / name
            self.assertTrue(path.is_file(), f"Missing SVG asset: {name}")
            raw = path.read_text(encoding="utf-8")
            self.assertNotIn("c2pa:manifest", raw, f"{name} contains C2PA base64 bloat")
            self.assertNotIn("<metadata>", raw, f"{name} contains unnecessary metadata block")
            self.assertNotIn("@import", raw, f"{name} uses external @import blocked by GitHub Camo CSP")
            self.assertNotIn("<animate", raw, f"{name} uses SMIL <animate> instead of CSS reduced-motion gated keyframes")
            root = ET.fromstring(raw)
            self.assertEqual(root.attrib.get("role"), "img", f"{name} missing role='img'")
            self.assertIn("aria-labelledby", root.attrib, f"{name} missing aria-labelledby attribute")
            self.assertNotEqual(root.attrib.get("aria-label"), "Graphic", f"{name} uses generic aria-label='Graphic'")
            ns = {"svg": "http://www.w3.org/2000/svg"}
            title = root.find("svg:title", ns)
            desc = root.find("svg:desc", ns)
            self.assertIsNotNone(title, f"{name} missing <title> element (WCAG 1.1.1)")
            self.assertIsNotNone(desc, f"{name} missing <desc> element (WCAG 1.1.1)")
            self.assertTrue((title.text or "").strip(), f"{name} has empty <title>")
            self.assertTrue((desc.text or "").strip(), f"{name} has empty <desc>")
            self.assertIn("prefers-reduced-motion: reduce", raw, f"{name} missing WCAG 2.3.3/2.2.2 reduced-motion gate")

    def test_deterministic_svg_builder_check(self):
        builder = ROOT / "scripts" / "build_profile.py"
        self.assertTrue(builder.is_file(), "Missing scripts/build_profile.py")
        res = subprocess.run(
            [sys.executable, str(builder), "--check"],
            cwd=str(ROOT),
            capture_output=True,
            text=True,
        )
        self.assertEqual(res.returncode, 0, f"build_profile.py --check failed:\n{res.stdout}\n{res.stderr}")

    def test_readme_links_and_assets(self):
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        for name in SVG_FILES:
            self.assertIn(f"assets/{name}", readme, f"README.md does not reference assets/{name}")
        self.assertNotIn('alt=""', readme, "README.md contains empty alt attribute")
        self.assertIn("<picture>", readme, "README.md missing <picture> dark/light theme support")
        for repo in REQUIRED_REPOS:
            url = f"https://github.com/tejaswin-amara/{repo}"
            self.assertIn(url, readme, f"README.md missing direct link to {url} (violates ADR-0001)")

    def test_workflows_sha_pinned_and_hardened(self):
        wf_dir = ROOT / "scripts" / "workflows"
        if not wf_dir.is_dir():
            wf_dir = ROOT / ".github" / "workflows"
        for wf_name in ("ci.yml", "snake.yml"):
            wf_path = wf_dir / wf_name
            self.assertTrue(wf_path.is_file(), f"Missing workflow {wf_name}")
            text = wf_path.read_text(encoding="utf-8")
            self.assertRegex(text, r"(?m)^permissions:\s*\n\s+contents:\s*read", f"{wf_name} must default to permissions: contents: read")
            self.assertIn("step-security/harden-runner@", text, f"{wf_name} missing harden-runner step")
            self.assertIn("persist-credentials: false", text, f"{wf_name} missing persist-credentials: false")
            for m in USES_RE.finditer(text):
                ref = m.group(1)
                self.assertIn("@", ref, f"{wf_name} unpinned uses: {ref}")
                _, sha = ref.rsplit("@", 1)
                self.assertRegex(sha, SHA_RE, f"{wf_name} uses mutable ref {ref} instead of 40-char SHA")

    def test_governance_and_architecture_docs(self):
        required_files = [
            "AGENTS.md",
            "CLAUDE.md",
            "SECURITY.md",
            "LICENSE",
            "lychee.toml",
            ".gitleaks.toml",
            ".markdownlint-cli2.jsonc",
            "_typos.toml",
            "renovate.json",
            "lefthook.yml",
            ".github/pull_request_template.md",
            "docs/architecture/adr/0001-profile-modernization-pipeline.md",
            "docs/architecture/adr/0002-deterministic-accessible-profile-pipeline.md",
            "docs/architecture/STRIDE-profile-pipeline.md",
        ]
        for rel_path in required_files:
            p = ROOT / rel_path
            self.assertTrue(p.is_file(), f"Missing governance/architecture file: {rel_path}")
        agents_lines = (ROOT / "AGENTS.md").read_text(encoding="utf-8").splitlines()
        self.assertLessEqual(len(agents_lines), 150, "AGENTS.md must stay under 150 lines")


if __name__ == "__main__":
    unittest.main()
