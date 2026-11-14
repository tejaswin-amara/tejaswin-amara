# Security Policy

## Scope

This repository powers the public GitHub profile for [`@tejaswin-amara`](https://github.com/tejaswin-amara). It is intentionally static (`README.md`, deterministic SVG assets under `assets/`, and SHA-pinned GitHub Actions workflows).

## Security Controls

- **Supply-Chain Pinning:** Every GitHub Action in `.github/workflows/` is pinned to an immutable 40-character commit SHA and monitored with `step-security/harden-runner`.
- **Least Privilege:** Workflows default to `permissions: contents: read` and `persist-credentials: false`.
- **Secret Scanning:** Enforced via Gitleaks (`.gitleaks.toml`) in CI and pre-commit hooks (`lefthook.yml`).
- **CSP-Safe Assets:** SVG cards are generated deterministically by `scripts/build_profile.py` using Python's standard library (`html.escape` + `xml.etree.ElementTree`), containing zero scripts, zero external font imports, and zero C2PA metadata blobs.

## Reporting a Vulnerability

If you discover a security issue in this repository or any linked project by Tejaswin Amara, please report it privately via email to **tejaswinamara@klh.edu.in** with reproduction details. Please do not open a public issue for unpatched vulnerabilities.
