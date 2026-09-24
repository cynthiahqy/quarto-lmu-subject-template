# LMU Quarto subject website template

Minimal LMU-branded template for a course website: home page with generated schedule, syllabus, and weekly slides + practical.

## Use

1. Copy this folder (or use it as a GitHub template repo).
2. Edit `_variables.yml`, `_brand.yml`, `_quarto.yml` (search for `TODO`).
3. `./_utilities/new-week.sh 02 slug "Topic" YYYY-MM-DD` for each week.
4. `quarto preview`.
5. Push to GitHub; enable Pages on the `gh-pages` branch.

See `AGENTS.md` for structure and conventions.

## Slide theme

Slides use the `lmu-revealjs` format from [quarto-lmu-revealjs](https://github.com/soda-lmu/quarto-lmu-revealjs), vendored in `_extensions/lmu/`. To update: `quarto update extension soda-lmu/quarto-lmu-revealjs`.
