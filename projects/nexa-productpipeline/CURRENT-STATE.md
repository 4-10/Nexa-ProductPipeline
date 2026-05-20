# Nexa Product Pipeline - CURRENT STATE

**Last updated:** 2026-05-20
**Updated by:** Codex Overwatch hygiene session

## Active Focus

Product Pipeline remains a KB-backed planning and artifact-generation workspace, not a runtime service. Its useful proven shape is: reviewed intake/packet material can become a generated artifact run, a review-gated proposal, and accepted Research-gate output without automatically creating broad live issue queues.

## Operator Dashboard

| Area | Current signal | Next move |
|---|---|---|
| Workflow baseline | v0 workflow, gates, packet templates, packet-to-run generator, and tests exist. | Keep generated output review-gated. |
| Launch Intake run | Candidate 1 review was accepted; managed-pilot offer validation is accepted. | Use buyer conversations to validate package language before public/billing work. |
| GitHub output | Issues `#1`, `#2`, and `#3` are closed/Done. | Do not create new live issues without an accepted proposal or explicit approval. |
| Local hygiene | The old repo-local `product-pipeline-v0-artifacts` worktree was removed after verification; `main` is the active local branch. | Use a fresh branch/worktree only when a new scoped implementation lane starts. |

## Last Action Taken

The managed-pilot offer validation artifact remains the latest product output. This Overwatch hygiene pass removed the stale merged worktree and compacted this current-state file so long chronology stays in `AUDIT-LOG.md`, `STATE-SNAPSHOT.md`, run artifacts, and reviews.

## Next Intended Move

Use the accepted offer validation as source material for Overwatch commercial readiness and future buyer conversations. Keep any future Product Pipeline output Research-gated until buyer conversations validate willingness to pay and package language.

## Open Decisions

- Should v0 issue creation require explicit approval every time, or can trusted runs auto-create research spikes?
- Should packet-to-run generation become a Codex/Nexa skill after one more reviewed run?
- Do the first three buyer conversations confirm willingness to pay for the $4,500 private managed pilot?
- Where should Launch Intake pilot artifacts live once the local pilot becomes a repo-backed product lane?

## State Health

| Component | Verify with |
|---|---|
| Local repo | `git -C C:\Projects\Nexa-ProductPipeline status --short --branch` |
| GitHub Project | `gh project view 4 --owner 4-10` |
| Open issues/PRs | `gh issue list --repo 4-10/Nexa-ProductPipeline --state open`; `gh pr list --repo 4-10/Nexa-ProductPipeline --state open` |
| Packet-to-run generator | `powershell -NoProfile -ExecutionPolicy Bypass -File C:\Projects\Nexa-ProductPipeline\product-pipeline\tools\Test-ProductPipelineRunFromPacket.ps1` |

## Key Artifacts

- `product-pipeline/workflows/product-pipeline-v0.md` - v0 artifact workflow.
- `product-pipeline/tools/New-ProductPipelineRunFromPacket.ps1` - packet-to-run generator.
- `product-pipeline/tools/Test-ProductPipelineRunFromPacket.ps1` - generator regression test.
- `product-pipeline/runs/2026-05-19-launch-intake-desk-artifact-run/` - generated Launch Intake artifact run.
- `product-pipeline/reviews/2026-05-19-launch-intake-desk-artifact-run-review.md` - accepted Draft Ready review.
- `product-pipeline/research/2026-05-19-launch-intake-managed-pilot-offer-validation.md` - accepted managed-pilot validation.

## Verification Rule

Treat this file as a dashboard. Verify GitHub/repo state and the exact artifact relevant to the task before creating, closing, or promoting Product Pipeline work.
