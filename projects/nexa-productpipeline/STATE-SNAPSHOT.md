# Nexa Product Pipeline - State Snapshot

**Last updated:** 2026-05-16

## Repository

| Item | Value |
|---|---|
| Local path | `C:/Projects/Nexa-ProductPipeline` |
| GitHub repo | `https://github.com/4-10/Nexa-ProductPipeline` |
| Default branch | `main` |
| Current artifact | Working KB and task tracker |
| Runtime artifact | Not chosen yet |
| Issue templates | `.github/ISSUE_TEMPLATE/` |
| Initial labels | `type:spike`, `type:story`, `type:defect`, `area:kb`, `area:product`, `area:github-project`, `area:design`, `status:claimed` |

## GitHub Project

| Item | Value |
|---|---|
| Project title | `Nexa Product Pipeline` |
| Project number | `4` |
| Project URL | `https://github.com/users/4-10/projects/4` |
| Linked repo | `4-10/Nexa-ProductPipeline` |
| Custom fields | `Work Type`, `Readiness Gate`, `Module Boundary` |

## Reference Inputs Reviewed At Initialization

- `C:/Projects/NoderaOS-High-Level-Catchup.md`
- `C:/Projects/Nexa-AOS`
- `C:/Projects/Nexa-AppGenerator`
- `C:/Projects/Project-X-Insurtech-KB`

## Current Artifact Boundary

This repo is not yet a CLI, service, app, skill, or prompt package. It is a KB-backed planning and build workspace for deciding and creating that future artifact.

## Verification Commands

```powershell
git -C C:\Projects\Nexa-ProductPipeline status --short --branch
gh project view 4 --owner 4-10
rg -n -e "Project[-]X" -e "project[-_]x" -e "Insurtech" -e "insurance" -e "carrier" -e "quoting" C:\Projects\Nexa-ProductPipeline
```
