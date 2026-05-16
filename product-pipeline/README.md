# Product Pipeline Module Artifacts

This folder contains the first implementation artifacts for Product Pipeline v0.

V0 is intentionally workflow-first. It proves the product artifact ladder before adding broad automation.

## Current Boundary

Product Pipeline v0 owns:

- structured product intake,
- research and comparison artifacts,
- opportunity synthesis,
- epic and issue candidate generation,
- readiness and design gates,
- parent KB update instructions,
- review-gated GitHub output.

Product Pipeline v0 does not own:

- implementation work,
- final app generation,
- visual design execution,
- a separate runtime KB for generated products.

## Layout

- `templates/` - reusable artifact templates.

Planned folders for later Product Pipeline v0 slices:

- `workflows/` - operating instructions for running Product Pipeline.
- `checklists/` - readiness and dependency gates.
- `proposals/` - reviewable output proposals before GitHub creation.
- `how-to/` - repeatable procedures for using outputs.
