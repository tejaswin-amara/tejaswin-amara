#!/usr/bin/env python3
"""Sync hardened SHA-pinned workflow templates from scripts/workflows/ into .github/workflows/."""
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "scripts" / "workflows"
DST = ROOT / ".github" / "workflows"

DST.mkdir(parents=True, exist_ok=True)
for wf in ("ci.yml", "snake.yml"):
    shutil.copy(SRC / wf, DST / wf)
    print(f"Synced {DST / wf}")
