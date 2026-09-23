# ADR 0001: Profile Modernization Pipeline

## Status
Proposed

## Context
We need to modernize the GitHub profile repository into an automated developer platform. The current profile uses static SVGs and a basic GitHub action for a snake grid. We want to implement dynamic metrics, telemetry, and a more responsive, dark-mode/OLED-first design using a modern stack.

## Decision
We will adopt the following architecture and toolchain:
- **UI & Layout**: Next.js with Tailwind CSS, utilizing V0 for initial layout generation and design system.
- **Data & Persistence**: Supabase for storing profile metadata and visitor stats. Neon for ephemeral branching and schema migration testing.
- **Analytics & ETL**: Tinybird for real-time ingest pipes, and Stitch (or equivalent) for data syncing.
- **Hosting**: Render for the edge worker generating dynamic SVGs and caching stats.
- **CI/CD & Security**: GitHub Actions with Lefthook (pre-commit), Biome (linting), Gitleaks & Trivy (security), and Lychee (link checking).

## Consequences
- Requires setting up external infrastructure (Supabase, Neon, Render, Tinybird).
- Will increase the complexity of the repository but provide rich, dynamic functionality.
