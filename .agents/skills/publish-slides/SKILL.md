---
name: publish-slides
description: Pre-publish checklist for one week's slides (files, mechanical checks, metadata, language, structure, render). Use before publishing a week, e.g. `/publish-slides 02-topic`.
argument-hint: <week-folder>
---

Week folder is `$ARGUMENTS` (e.g. `02-topic`); if empty, ask which week.

Run each check, fix problems as you go, and ask before removing anything ambiguous (e.g. a TODO). End with the summary table.

## 1. Files
List `<week>/slides.qmd` plus every `{{< include >}}` target it references (recursively). Report any target that does not exist.

## 2. Mechanical checks (all listed files)
- **Unclosed fenced divs**: run
  ```bash
  awk '/^:::+[ \t]*$/{if(n>0)n--; else print FILENAME":"NR": extra :::"; next} /^:::+[ \t]+[^ \t]/ && !/-->[ \t]*$/{n++; l[n]=NR} END{for(i=1;i<=n;i++) print FILENAME":"l[i]": unclosed div"}' <file>
  ```
- **Leftovers**: `TODO`, `FIXME`, `placeholder`, and `draft: true` in the YAML (remove the draft flag).
- **Chunk labels**: every code chunk starts with `#| label: ...`; add a descriptive label where missing.

## 3. Metadata
Compare against `_variables.yml` (`weeks.wNN`): `date:` matches the week's date and `subtitle:` has the right week number and topic. Flag any other hardcoded dates that disagree with `_variables.yml`.

## 4. Language
Read the prose and code blocks. Fix clear spelling/grammar errors, wrong command or flag names in code, and inconsistent terminology; flag borderline cases.

## 5. Structure
Section order per `AGENTS.md` (Announcements, Last Week, This Week, content sections, Summary; week 1 may omit Last Week). Also check any other slide conventions listed in `AGENTS.md`.

## 6. Render
`quarto render <week>/slides.qmd`. Fix errors; report warnings.

## Summary
Table of checks (divs, leftovers, labels, includes, metadata, language, structure, render) with ✓ or ✗ and a count. Mark ready to publish only when all are ✓.
