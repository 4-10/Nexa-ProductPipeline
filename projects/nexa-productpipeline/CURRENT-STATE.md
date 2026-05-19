# Nexa Product Pipeline - CURRENT STATE

**Last updated:** 2026-05-18
**Updated by:** Codex Overwatch session (Launch Intake pilot run)

## Active Focus

The Nexa Product Pipeline repository has been cloned and initialized with a sanitized working KB based on the Project-X KB pattern. A repo-linked GitHub Project has been created for module work tracking.

The active focus is that Product Pipeline v0 has now been used for the first Overwatch `#7` pilot idea: Nodera Launch Intake. This is a review-gated artifact run only. No GitHub issues or Project items have been created from the run.

## Last Action Taken

Created the Nodera Launch Intake pilot artifact run and a review-needed GitHub output proposal for Overwatch `#7`.

## Next Intended Move

Review the Launch Intake proposal. If accepted, create or assign Candidate 1 first: define the reusable Launch Intake packet contract. Keep Candidate 3 blocked until the AppBuilder substrate decision is made.

## Open Decisions

- Should v0 issue creation require explicit approval every time, or can trusted runs auto-create research spikes?
- Should the Launch Intake Candidate 1 issue be created now, or should Overwatch own the packet contract directly?
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
- `product-pipeline/` - v0 Product Pipeline artifact workspace.
- `product-pipeline/templates/` - intake, research, comparison, opportunity, design, epic, issue, and parent-KB update templates.
- `product-pipeline/workflows/product-pipeline-v0.md` - end-to-end v0 artifact workflow.
- `product-pipeline/checklists/readiness-gate.md` - ready-for-GitHub issue gate.
- `product-pipeline/checklists/design-needed-gate.md` - design-collaboration routing gate.
- `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md` - self-dogfood proposal for the first Product Pipeline issue candidates.
- `product-pipeline/how-to/create-github-output-from-proposal.md` - review-gated procedure for creating approved GitHub issues and Project items.
- `product-pipeline/reviews/2026-05-18-v0-activation-review.md` - Overwatch `#4` activation review and accepted v0 baseline decision.
- `product-pipeline/runs/2026-05-18-nodera-launch-intake/` - first Overwatch `#7` Product Pipeline run for a small reusable pilot idea.
- `product-pipeline/proposals/2026-05-18-nodera-launch-intake-pilot-proposal.md` - review-needed GitHub output proposal for Launch Intake issue candidates.
- `.github/ISSUE_TEMPLATE/` - initial research spike, feature/story, and defect issue forms.
- GitHub labels - initial type, area, and claim labels for module work.
- `shared/reference/architecture.md` - first module-boundary reference.
- `shared/reference/research-discovery.md` - first research-stage reference.
- `shared/reference/backlog-generation.md` - first backlog and ready-for-dev reference.
- `shared/reference/design-collaboration.md` - initial design-boundary reference.
- `shared/reference/parent-kb-integration.md` - final runtime KB integration rule.

## Active Testbed / Environment

KB and GitHub Project only. No Product Pipeline runtime, CLI, service, skill, prompt pack, or automation artifact exists yet. The accepted v0 artifact set has produced one review-gated pilot run.

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
