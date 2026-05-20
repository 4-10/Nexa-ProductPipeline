# Nexa Product Pipeline - State Snapshot

**Last updated:** 2026-05-20

## Repository

| Item | Value |
|---|---|
| Local path | `C:/Projects/Nexa-ProductPipeline` |
| GitHub repo | `https://github.com/4-10/Nexa-ProductPipeline` |
| Default branch | `main` |
| Runtime artifact | Not chosen yet |
| Current artifact | Working KB, GitHub Project, local packet-to-run generator, accepted Launch Intake artifact review, and accepted managed-pilot offer validation |
| Local worktrees | No repo-local Product Pipeline worktree is currently registered after the 2026-05-20 hygiene cleanup. |

## GitHub Project

| Item | Value |
|---|---|
| Project title | `Nexa Product Pipeline` |
| Project number | `4` |
| Project URL | `https://github.com/users/4-10/projects/4` |
| Linked repo | `4-10/Nexa-ProductPipeline` |
| Custom fields | `Work Type`, `Readiness Gate`, `Module Boundary` |
| Current live issues | `#1`, `#2`, and `#3` are closed/Done from the last verified snapshot. |

## Current Artifact Boundary

This repo is not yet a service, app, packaged skill, or prompt package. It is a KB-backed planning/build workspace with a local PowerShell generator for converting reviewed packet drafts into Product Pipeline artifact runs.

## Verification Commands

```powershell
git -C C:\Projects\Nexa-ProductPipeline status --short --branch
gh project view 4 --owner 4-10
gh issue list --repo 4-10/Nexa-ProductPipeline --state open
powershell -NoProfile -ExecutionPolicy Bypass -File C:\Projects\Nexa-ProductPipeline\product-pipeline\tools\Test-ProductPipelineRunFromPacket.ps1
```

## Durable References

- `product-pipeline/workflows/product-pipeline-v0.md`
- `product-pipeline/tools/New-ProductPipelineRunFromPacket.ps1`
- `product-pipeline/tools/Test-ProductPipelineRunFromPacket.ps1`
- `product-pipeline/reviews/2026-05-19-launch-intake-desk-artifact-run-review.md`
- `product-pipeline/research/2026-05-19-launch-intake-managed-pilot-offer-validation.md`
- `shared/reference/parent-kb-integration.md`
