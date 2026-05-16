# Nexa Product Pipeline KB

This repository is the working knowledge base and task-tracking home for building the Nexa Product Pipeline module.

Nexa Product Pipeline is intended to turn a human's early product guidance into researched, structured, developable work for Nexa. It should help agents ask the right product questions, run a research stage, compare the market, identify target users, sharpen differentiators, capture the emotional reason the product should exist, and convert the result into epics, stories, tasks, and ready-for-dev GitHub work.

This KB is a build-time operating aid only. The final Product Pipeline module should not keep a separate runtime KB. When the module is used inside Nexa, it should read from and write back to the parent project KB.

## Core Framing

- Parent effort: NoderaOS / Nexa-AOS, the agentic operating system for AI-native product and software delivery.
- Module: Nexa Product Pipeline.
- This repo: temporary module-build KB plus GitHub Project tracking for this module's design and implementation work.
- Downstream consumer: Nexa core and the AppGenerator/App Builder path.
- Starting point: a base AppBuilder shell that is intentionally unbranded and unfocused until product guidance shapes it.

## Layout

```text
Nexa-ProductPipeline/
|-- README.md
|-- INDEX.md
|-- SUBAGENT_BRIEFING.md
|-- GLOSSARY.md
|-- shared/
|   |-- stack/
|   |-- tooling/
|   |-- reference/
|   `-- how-to/
|-- projects/
|   `-- nexa-productpipeline/
|       |-- README.md
|       |-- CURRENT-STATE.md
|       |-- AUDIT-LOG.md
|       |-- DECISION-LOG.md
|       |-- OPEN-DEFECTS.md
|       |-- STATE-SNAPSHOT.md
|       `-- how-to/
|-- product-pipeline/
|   |-- templates/
|   |-- workflows/
|   `-- checklists/
|-- _templates/
`-- _meta/
```

## Reading Priority

1. `INDEX.md` - search task keywords and load the smallest useful set of files.
2. `README.md` - understand the repo role and module boundary.
3. `projects/nexa-productpipeline/README.md` - module identity.
4. `projects/nexa-productpipeline/CURRENT-STATE.md` - current state. Run its verification rule.
5. `projects/nexa-productpipeline/AUDIT-LOG.md` - recent history.
6. Domain files under `shared/reference/` only when the task touches that area.

## Single Source Of Truth

| Kind of knowledge | Lives in |
|---|---|
| Living state | `projects/nexa-productpipeline/CURRENT-STATE.md` |
| Append-only change history | `projects/nexa-productpipeline/AUDIT-LOG.md` |
| Decision rationale | `projects/nexa-productpipeline/DECISION-LOG.md` |
| Known defects and active risks | `projects/nexa-productpipeline/OPEN-DEFECTS.md` |
| Evergreen module knowledge | `shared/reference/` |
| Cross-module procedures | `shared/how-to/` |
| Module-specific procedures | `projects/nexa-productpipeline/how-to/` |

Source code and module artifacts are canonical for implementation facts once they exist. This KB is canonical for context, decisions, research findings, and operating knowledge while the module is being built.

## GitHub Sync Model

GitHub is the canonical backup for this working KB:

`https://github.com/4-10/Nexa-ProductPipeline`

The local clone at `C:/Projects/Nexa-ProductPipeline` is the working cache sessions and agents should read from and edit.

At session start:

```powershell
git -C C:\Projects\Nexa-ProductPipeline pull --ff-only
```

If the pull fails because of local changes, stop and reconcile instead of overwriting files.

After meaningful KB changes:

```powershell
git -C C:\Projects\Nexa-ProductPipeline status
git -C C:\Projects\Nexa-ProductPipeline add -A
git -C C:\Projects\Nexa-ProductPipeline commit -m "Update Nexa Product Pipeline KB"
git -C C:\Projects\Nexa-ProductPipeline push
```

If there are no KB changes, do not create an empty commit.

## Task Tracking

Use the repo-linked GitHub Project for live work:

`https://github.com/users/4-10/projects/4`

The KB should explain durable process and decisions. GitHub Issues and the GitHub Project should own the live backlog, claim state, status, and completion flow.

## Maintenance Discipline

- After meaningful action: append to `AUDIT-LOG.md`.
- After a non-obvious design choice: append to `DECISION-LOG.md`.
- After completing major work: update `CURRENT-STATE.md`.
- After discovering a repeatable procedure: add a how-to and register it in `INDEX.md`.
- After creating any new doc: register it in `INDEX.md`.

Treat maintenance as part of the work, not post-work cleanup.
