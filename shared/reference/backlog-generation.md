# Backlog Generation

## Purpose

Backlog generation turns product artifacts into GitHub work that Nexa agents can actually build.

## Live Tracking

- Repository: `https://github.com/4-10/Nexa-ProductPipeline`
- GitHub Project: `https://github.com/users/4-10/projects/4`
- Custom project fields created for this module:
  - `Work Type`
  - `Readiness Gate`
  - `Module Boundary`

## Work Item Levels

Product Pipeline can produce different levels depending on confidence:

- Research spike: answer an unknown.
- Epic: define a coherent capability area.
- Story: define user-visible behavior.
- Task: define bounded implementation or operational work.
- Defect: fix broken behavior or stale KB state.

## Ready-For-Dev Gate

A work item should not be marked ready for dev unless it includes:

- goal,
- context,
- non-goals,
- expected output artifact,
- acceptance criteria,
- verification plan,
- likely files or modules affected,
- KB update expectation,
- dependencies and blockers,
- evidence or decision link when product direction matters.

## Anti-Patterns

- Generating many issues from a vague idea before research.
- Treating epics as implementation tickets.
- Creating tasks without non-goals.
- Creating tasks that require a designer without a design handoff.
- Claiming work from stale project state.

## GitHub Project Use

Use `Work Type` to distinguish discovery, research, epic, story, task, design, KB ops, and defects.

Use `Readiness Gate` to show whether the item is in intake, research, spec, draft-ready, dev-ready, or blocked.

Use `Module Boundary` to show whether the item belongs to Product Pipeline, parent KB integration, AppGenerator, design module collaboration, or GitHub Project automation.
