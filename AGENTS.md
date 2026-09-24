# AGENTS.md

Quarto website for **Subject Name**: weekly Reveal.js slides and HTML practicals.

## Commands

```bash
quarto preview                      # live preview
quarto render                       # full site to _site/
quarto render 02-topic/slides.qmd   # single file
# /publish-slides 02-topic          # skill: pre-publish checklist for a week
./_utilities/new-week.sh 02 slug "Topic" YYYY-MM-DD   # scaffold a week + register it in _variables.yml
```

## Architecture

- `_quarto.yml` — project config, navbar, render allowlist, freeze
- `_brand.yml` — colours, fonts, logo
- `_variables.yml` — course metadata and week list (single source of truth; the schedule table on `index.qmd` is generated from it)
- `_slides.yml` — shared Reveal.js defaults; each deck loads it via `metadata-files: [../_slides.yml]`
- `_slides-setup.R` — shared setup chunk for slides
- `style/` — `custom.scss` (HTML) and `custom-revealjs.scss` (slides)
- `NN-topic/` — one folder per week
- `_utilities/` — `new-week.sh` and `week-template/`; the script copies the template; edit this to change what new weeks contain

## Per-week folder

| File | Role |
|---|---|
| `slides.qmd` | Reveal.js lecture |
| `practical.qmd` | HTML exercise sheet |
| `quiz.qmd` | Reveal.js multiple-choice quiz (answers as fragments); delete if not needed |
| `_session-plan.qmd` | private notes, not rendered |
| `images/` | week-specific assets |

Underscore-prefixed files are partials: include them with `{{< include >}}`; they are never rendered as pages.

## Adding a week

1. `./_utilities/new-week.sh NN slug "Topic" YYYY-MM-DD`
2. Fill in slides and practical. The schedule table updates automatically.
3. For a no-class week, add an entry to `_variables.yml` with `number`, `date` and `note` only (no `folder`).

## Slide conventions

- Section order: `# Announcements`, `# Last Week`, `# This Week`, content sections (`# Section`, `##` slides), `# Summary`.
- Add new conventions here (fragments, callouts, etc.) as the course develops.

## Optional additions

Reflection prompts, group projects and exams are not part of the base template; add them per unit and register them in `_quarto.yml` and `_utilities/week-template/`.
