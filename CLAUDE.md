# console.orcastration.ai

Console dashboard for the Orca platform. Built with Astro. Currently a "coming soon" static page; will eventually become an SPA.

## Commands

Requires Node 22 (see `.nvmrc`) and pnpm 10.33.0.

```sh
pnpm install       # install dependencies
pnpm dev           # dev server on localhost:4321
pnpm build         # build to dist/
pnpm lint          # astro check + eslint
pnpm lint:fix      # eslint with auto-fix
pnpm test          # run vitest
pnpm verify        # lint + test with coverage (run before pushing)
```

## Structure

- `src/pages/` — file-based routing, each `.astro` file becomes a page
- `src/layouts/Base.astro` — shared HTML shell (meta tags, fonts, ambient background)
- `public/` — static assets (favicon, robots.txt)
- `terraform/` — infrastructure (S3 + CloudFront via shared static-site module)

## Design Tokens

All visual values are `--orca-*` CSS custom properties from the `@orcastration-ai/design` package. Always use tokens — never hardcode colors, spacing, or fonts.

Key tokens:
- **Colors:** `--orca-abyss` (bg), `--orca-surface`, `--orca-breach` (white), `--orca-signal` (cyan accent), `--orca-current` (blue accent), `--orca-mist`
- **Fonts:** `--orca-font-display`, `--orca-font-body` (Inter), `--orca-font-mono` (JetBrains Mono)
- **Sizes:** `--orca-text-hero`, `--orca-text-section`, `--orca-text-sub`, `--orca-text-body`
- **Spacing:** `--orca-section-pad`, `--orca-container-max`, `--orca-container-gutter`

## Deployment

- Push to `main` deploys to **dev** (`console.dev.orcastration.ai`)
- Git tag `v*` creates a GitHub Release and deploys to **prod** (`console.orcastration.ai`)
- Site ID for SSM parameter lookups: `console-orcastration-ai`
- SPA mode is enabled in Terraform (CloudFront routes all paths to `index.html`)
