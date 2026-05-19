# Nexa Product Pipeline - CURRENT STATE

**Last updated:** 2026-05-19
**Updated by:** Codex session (managed-pilot offer validation closeout)

## Active Focus

The Nexa Product Pipeline repository has been cloned and initialized with a sanitized working KB based on the Project-X KB pattern. A repo-linked GitHub Project has been created for module work tracking.

The active focus is now using the accepted managed-pilot offer validation to inform trust-surface and local-runner follow-up work. A local packet-to-run generator exists, has a regression test, and produced the Launch Intake Desk artifact run from the pilot KB packet draft. Candidate 1 from the generated proposal was reviewed through `4-10/Nexa-ProductPipeline#2`, accepted as Draft Ready Product Pipeline output, and closed/Done. `4-10/Nexa-ProductPipeline#3` produced the Research-gate managed-pilot offer validation artifact and is closed/Done.

## Last Action Taken

Completed the managed-pilot offer validation artifact at `product-pipeline/research/2026-05-19-launch-intake-managed-pilot-offer-validation.md`. It recommends privately testing a $4,500 Launch Intake Managed Pilot, with $2,500 artifact-only and $7,500-$12,500 local-workspace variants, while keeping billing, public pricing, self-serve SaaS, production deployment, and AppBuilder implementation out of scope.

## Next Intended Move

Use the accepted offer validation as a source for Overwatch commercial readiness and future buyer conversations. Keep any future Product Pipeline output Research-gated until buyer conversations validate willingness to pay and package language.

## Open Decisions

- Should v0 issue creation require explicit approval every time, or can trusted runs auto-create research spikes?
- Where should the Launch Intake pilot KB live: inside Overwatch, a new local project folder, or a future repo?
- Should Product Pipeline use the existing Nexa safe-task claim protocol immediately, or wait until implementation work starts?
- Should the first module artifact live as a Codex skill under this repo, a Nexa-AOS skill, or both during development?
- Should packet-to-run generation become a Codex/Nexa skill after one more manually reviewed run proves the shape?
- Do the first three buyer conversations confirm willingness to pay for the $4,500 private managed pilot?

## State Health

| Component | Expected state | Verify with |
|---|---|---|
| Local repo | Local repo exists and tracks `4-10/Nexa-ProductPipeline` | `git -C C:\Projects\Nexa-ProductPipeline status --short --branch` |
| GitHub Project | Project `Nexa Product Pipeline` exists and is linked to repo | `gh project view 4 --owner 4-10` |
| Sanitization | No Project-X or vertical-domain residue remains outside historical notes about source seed | `rg -n -e "Project[-]X" -e "project[-_]x" -e "Insurtech" -e "insurance" -e "carrier" -e "quoting" C:\Projects\Nexa-ProductPipeline` |
| Routing | `INDEX.md` points to existing files | Spot-check links in `INDEX.md` and run file existence checks if editing structure |
| Module boundary | Repo clearly says this is a temporary build KB, not final module runtime KB | Read root `README.md`, this file, and `shared/reference/parent-kb-integration.md` |
| Packet-to-run generator | Local generator passes its self-test before generated runs are trusted | `powershell -NoProfile -ExecutionPolicy Bypass -File C:\Projects\Nexa-ProductPipeline\product-pipeline\tools\Test-ProductPipelineRunFromPacket.ps1` |

## Recent Significant Artifacts

- `C:/Projects/Nexa-ProductPipeline` - local working repo.
- `https://github.com/4-10/Nexa-ProductPipeline` - GitHub repository.
- `https://github.com/users/4-10/projects/4` - repo-linked GitHub Project.
- `docs/superpowers/specs/2026-05-16-product-pipeline-v0-design.md` - v0 design draft awaiting Richard review.
- `docs/superpowers/plans/2026-05-16-product-pipeline-v0-implementation.md` - implementation plan for v0 workflow artifacts.
- `product-pipeline/` - v0 Product Pipeline artifact workspace.
- `product-pipeline/templates/` - intake, research, comparison, opportunity, design, epic, issue, launch packet, and parent-KB update templates.
- `product-pipeline/workflows/product-pipeline-v0.md` - end-to-end v0 artifact workflow.
- `product-pipeline/checklists/readiness-gate.md` - ready-for-GitHub issue gate.
- `product-pipeline/checklists/design-needed-gate.md` - design-collaboration routing gate.
- `product-pipeline/proposals/2026-05-16-self-dogfood-issue-proposal.md` - self-dogfood proposal for the first Product Pipeline issue candidates.
- `product-pipeline/how-to/create-github-output-from-proposal.md` - review-gated procedure for creating approved GitHub issues and Project items.
- `product-pipeline/reviews/2026-05-18-v0-activation-review.md` - Overwatch `#4` activation review and accepted v0 baseline decision.
- `product-pipeline/runs/2026-05-18-nodera-launch-intake/` - first Overwatch `#7` Product Pipeline run for a small reusable pilot idea.
- `product-pipeline/runs/2026-05-18-nodera-launch-intake/launch-intake-packet.md` - accepted concrete packet for the next KB Core handoff.
- `product-pipeline/proposals/2026-05-18-nodera-launch-intake-pilot-proposal.md` - review-needed GitHub output proposal for Launch Intake issue candidates.
- `product-pipeline/templates/launch-intake-packet.md` - reusable packet contract template for future launch workflows.
- `product-pipeline/tools/New-ProductPipelineRunFromPacket.ps1` - local packet-draft to artifact-run generator.
- `product-pipeline/tools/Test-ProductPipelineRunFromPacket.ps1` - generator regression test.
- `product-pipeline/runs/2026-05-19-launch-intake-desk-artifact-run/` - generated full artifact run from the Launch Intake pilot KB packet draft.
- `product-pipeline/proposals/2026-05-19-launch-intake-desk-artifact-run-proposal.md` - proposal approved for Candidate 1 only.
- `product-pipeline/proposals/issue-bodies/launch-intake-desk-artifact-run-review.md` - issue body used for `4-10/Nexa-ProductPipeline#2`.
- `product-pipeline/reviews/2026-05-19-launch-intake-desk-artifact-run-review.md` - accepted Draft Ready review outcome for the Launch Intake Desk artifact run.
- `product-pipeline/proposals/issue-bodies/launch-intake-managed-pilot-offer-validation.md` - Research-gate issue body for the next managed-pilot offer validation item.
- `product-pipeline/research/2026-05-19-launch-intake-managed-pilot-offer-validation.md` - accepted Research-gate output for buyer, package, objections, and pricing hypothesis.
- `https://github.com/4-10/Nexa-ProductPipeline/issues/3` - closed/Done after accepted Research-gate output.
- `https://github.com/4-10/Nexa-ProductPipeline/issues/2` - closed/Done tracker item for reviewing the Launch Intake Desk full artifact run.
- `https://github.com/4-10/Nexa-ProductPipeline/issues/1` - closed/Done tracker item for the Launch Intake packet contract.
- `.github/ISSUE_TEMPLATE/` - initial research spike, feature/story, and defect issue forms.
- GitHub labels - initial type, area, and claim labels for module work.
- `shared/reference/architecture.md` - first module-boundary reference.
- `shared/reference/research-discovery.md` - first research-stage reference.
- `shared/reference/backlog-generation.md` - first backlog and ready-for-dev reference.
- `shared/reference/design-collaboration.md` - initial design-boundary reference.
- `shared/reference/parent-kb-integration.md` - final runtime KB integration rule.

## Active Testbed / Environment

KB, GitHub Project, and local PowerShell generator only. No Product Pipeline runtime service, UI, packaged skill, or automation worker exists yet. The accepted v0 artifact set has produced one review-gated pilot run, one reusable packet contract, one generated packet-to-run artifact set, one approved live review issue, and one managed-pilot offer validation artifact.

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
