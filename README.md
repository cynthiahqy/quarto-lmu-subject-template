# LMU Quarto subject website template

Minimal LMU-branded template for a course website: home page with generated schedule, syllabus, and weekly slides + practical.

## Use

1. Copy this folder (or use it as a GitHub template repo).
2. Edit `_variables.yml`, `_brand.yml`, `_quarto.yml` (search for `TODO`).
3. `./_utilities/new-week.sh 02 slug "Topic" YYYY-MM-DD` for each week.
4. `quarto preview`.
5. Push to GitHub; enable Pages on the `gh-pages` branch.

See `AGENTS.md` for structure and conventions.

## Quarto version

Developed and tested with Quarto **1.10.18**, pinned in `.github/workflows/publish.yml` so CI builds match local renders. When you upgrade Quarto locally, update the pinned `version:` there too.

## Slides: the LMU Reveal.js extension (optional)

By default, decks use `format: lmu-revealjs`, provided by the [quarto-lmu-revealjs](https://github.com/cynthiahqy/quarto-lmu-revealjs) extension, vendored in `_extensions/lmu/`. It supplies the LMU theme (colours, title styling), a 1280×720 canvas, slide numbers and a fade transition. Course-level slide settings (chalkboard, code line numbers, footer, chunk options) live in `_slides.yml`, which each deck loads with `metadata-files: [../_slides.yml]`.

To update the extension: `quarto update extension cynthiahqy/quarto-lmu-revealjs`.

**You don't have to use it.** The rest of the site (schedule, brand, navbar, practicals) is independent of the slide format. To use something else:

- **Plain Reveal.js:** change `format: lmu-revealjs` to `format: revealjs` in each `slides.qmd` and `quiz.qmd` (and in `_utilities/week-template/`), and rename the `lmu-revealjs:` key in `_slides.yml` to `revealjs:`. Add your own `theme:` there if you want styling.
- **LaTeX slides (Beamer, PDF):** use `format: beamer` instead, and drop the Reveal.js-only options in `_slides.yml` (`chalkboard`, `code-line-numbers`, `width`/`height`, slide `logo`).
- **Remove the extension** once no deck uses it: delete `_extensions/lmu/`. Before you do, move the logo files that `_brand.yml` points to (`_extensions/lmu/logos/...`) to somewhere like `shared/` and update the paths, or the navbar logo will break.

The website `logo`, `favicon` and brand colours are set in `_brand.yml` and `_quarto.yml`, not in the extension.
