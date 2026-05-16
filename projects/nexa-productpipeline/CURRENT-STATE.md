# Nexa Product Pipeline - CURRENT STATE

**Last updated:** 2026-05-16
**Updated by:** Codex session (self-dogfood issue proposal)

## Active Focus

The Nexa Product Pipeline repository has been cloned and initialized with a sanitized working KB based on the Project-X KB pattern. A repo-linked GitHub Project has been created for module work tracking.

The active focus is reviewing the Product Pipeline self-dogfood issue proposal. The proposal uses the v0 workflow on Product Pipeline itself and keeps GitHub issue creation gated on Richard approval.

## Last Action Taken

Created `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md`.

## Next Intended Move

Richard approves which proposed issues to create after the current plan completes.

## Open Decisions

- Should v0 issue creation require explicit approval every time, or can trusted runs auto-create research spikes?
- Should Product Pipeline use the existing Nexa safe-task claim protocol immediately, or wait until implementation work starts?
- Should the first module artifact live as a Codex skill under this repo, a Nexa-AOS skill, or both during development?

## State Health

| Component | Expected state | Verify with |
|---|---|---|
| Local repo | Local repo exists and tracks `4-10/Nexa-ProductPipeline` | `git -C C:\Projects\Nexa-ProductPipeline status --short --branch` |
| GitHub Project | Project `Nexa Product Pipeline` exists and is linked to repo | `gh project view 4 --owner 4-10` |
| Sanitization | No Project-X or vertical-domain residue remains outside historical notes about source seed | `rg -n -e "Project[-]X" -e "project[-_]x" -e "Insurtech" -e "insurance" -e "carrier" -e "quoting" C:\Projects\Nexa-ProductPipeline` |
| Routing | `INDEX.md` points to existing files | Spot-check links in `INDEX.md` and run file existence checks if editing structure |
| Module boundary | Repo clearly says this is a temporary build KB, not final module runtime KB | Read root `README.md`, this file, and `shared/reference/parent-kb-integration.md` |

## Recent Significant Artifacts

- `C:/Projects/Nexa-ProductPipeline` - local working repo.
- `https://github.com/4-10/Nexa-ProductPipeline` - GitHub repository.
- `https://github.com/users/4-10/projects/4` - repo-linked GitHub Project.
- `docs/superpowers/specs/2026-05-16-product-pipeline-v0-design.md` - v0 design draft awaiting Richard review.
- `docs/superpowers/plans/2026-05-16-product-pipeline-v0-implementation.md` - implementation plan for v0 workflow artifacts.
- `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md` - self-dogfood proposal for the first Product Pipeline issue candidates.
- `.github/ISSUE_TEMPLATE/` - initial research spike, feature/story, and defect issue forms.
- GitHub labels - initial type, area, and claim labels for module work.
- `shared/reference/architecture.md` - first module-boundary reference.
- `shared/reference/research-discovery.md` - first research-stage reference.
- `shared/reference/backlog-generation.md` - first backlog and ready-for-dev reference.
- `shared/reference/design-collaboration.md` - initial design-boundary reference.
- `shared/reference/parent-kb-integration.md` - final runtime KB integration rule.

## Active Testbed / Environment

KB and GitHub Project only. No Product Pipeline runtime, CLI, service, skill, prompt pack, or automation artifact exists yet.

## Failure Modes To Watch For

- **Premature task generation** - creating developable tickets before research and target focus are strong enough.
- **Design boundary blur** - mixing design execution into Product Pipeline before the collaboration model is chosen.
- **Temporary KB confusion** - treating this build KB as the final module's runtime KB.
- **Board spam** - generating many GitHub issues that are not genuinely ready for work.
- **Parent KB drift** - designing module outputs without matching Nexa-AOS parent KB conventions.

## Verification Rule

Before acting on the claims above:

1. Check the date at top. If more than about one day old during active work, treat as suspect.
2. Run the verification commands in the State Health table that matter to the task.
3. Read the top entries of `AUDIT-LOG.md` and confirm they corroborate the Last Action Taken.
4. Spot-check one claim that matters to your current task using direct file inspection or GitHub state.

If any check disagrees, update this file before acting.
